import 'package:flutter/material.dart';

class NetflixHomePage extends StatelessWidget {
  NetflixHomePage({super.key});
  // Dummy data for movie posters
  final List<String> movieposters = [
    'https://content.wepik.com/statics/28430531/preview-page0.jpg',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180',
    'https://m.media-amazon.com/images/I/51ho+wLfYgL.jpg',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/space-movie-poster-design-template-6402bfc0a4e9e73ca351f43120e8c36a_screen.jpg?ts=1637002705',
    'https://cdn11.bigcommerce.com/s-8nvs2trnzz/images/stencil/608x608/products/206/473/646__68094.1695088201.jpg?c=1',
    'https://m.media-amazon.com/images/I/41tvjIbwFUL._AC_UF894,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/71u4ibuAdsL._AC_SL1500_.jpg',
    'https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/1500x1500/products/89058/93685/Joker-2019-Final-Style-steps-Poster-buy-original-movie-posters-at-starstills__62518.1669120603.jpg?c=2'
  ];

  // Dummy data for categories
  final List<String> categories = [
    'Trending Now',
    'Top Rated',
    'Action Movies',
    'Comedy Movies',
    'Horror Movies',
    'Romantic Movies',
    'Documentaries'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Netflix', style: TextStyle(fontSize: 30)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Add account functionality here
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Main Banner
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movieposters[0]),
                fit: BoxFit.cover,
              ),
            ),
            child: const Stack(
              children: [
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Featured Movie',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Categories List
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Horizontal list of categories
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Chip(
                    label: Text(categories[index]),
                    backgroundColor: Colors.grey[800],
                    labelStyle: const TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),

          // Movie Posters Grid
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'Popular Movies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: movieposters.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Add functionality for movie details
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    movieposters[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
