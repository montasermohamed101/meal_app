import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

   FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;


  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
     _glutenFree = widget.currentFilters['gluten'];
     _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
         IconButton(
             icon: Icon(Icons.save),
           onPressed: () {
               final Map<String, bool> selectedFilters = {
                 'gluten':_glutenFree,
                 'lactose':_lactoseFree,
                 'vegan':_vegan,
                 'vegetarian':_vegetarian,
               };

             widget.saveFilters(selectedFilters);
           },

         ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-free','Only include gluten_free meals.',_glutenFree,
                    (newValue){
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    'Lactose-free','Only include Lactose_free meals.',_lactoseFree,
                        (newValue){
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    'Vegetarian','Only include Vegetarian meals.',_vegetarian,
                        (newValue){
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                buildSwitchListTile(
                    'Vegan','Only include Vegan meals.',_vegan,
                        (newValue){
                      setState(() {
                        _vegan = newValue;
                      });
                    }),

              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
