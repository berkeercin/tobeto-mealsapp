import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screens/favorites.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  // context objesi => stateful widget => context objesi tüm noktalardan erişilebilr.
  // stateless widget => context objesi yanlızca build fonksiyonundan erişilebilir.
  void _changeScreen(Category category, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Meals(
              category: category,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bir kategori seçiniz"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const Favorites()));
                },
                icon: const Icon(Icons.favorite))
          ],
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2),
          children: [
            for (final c in categoryList)
              CategoryCard(
                category: c,
                onCategoryClick: () => _changeScreen(c, context),
              )
          ],
        ));
  }
}
