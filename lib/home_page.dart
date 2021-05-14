import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePge extends StatelessWidget {
  const HomePge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Meals',
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black87,
                  )),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 2)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: OverflowBox(
              child: GridView.builder(
                  itemCount: 20,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Transform.translate(
                      offset: Offset(0.0, index.isOdd ? 100 : 0.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(.5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipOval(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      'https://source.unsplash.com/random?sig=$index',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  const Text(
                                    'Random Image',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Unsplash',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                          5,
                                          (index) => const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )))
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}

class DualGridView extends StatelessWidget {
  const DualGridView(
      {Key? key,
      required this.builder,
      required this.itemcount,
      this.spacing = 0.0,
      this.asectratio = 0.5})
      : super(key: key);
  final IndexedWidgetBuilder builder;
  final int itemcount;
  final double spacing, asectratio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: asectratio,
            crossAxisSpacing: spacing,
            mainAxisExtent: spacing),
        itemBuilder: builder);
  }
}
