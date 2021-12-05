import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
          ),
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20.5),
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.shade100.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Total Per Person',
                            style: TextStyle(fontSize: 15, color: Colors.purple)),
                      ),
                      
                      
                      
                      Text(
                        '\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage )}',
                        style: TextStyle(
                            fontSize: 34.9,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid,
                    )),
                child: Column(
                  children: <Widget>[
                    TextField(
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                            prefixText: 'Bill Amount ',
                            prefixIcon: Icon(Icons.attach_money)),
                        onChanged: (String value) {
                          try {
                            _billAmount = double.parse(value);
                          } catch (exception) {
                            _billAmount = 0.0;
                            print('This character is not valid');
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Split',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCounter > 1) {
                                    _personCounter--;
                                  } else {}
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.purple.withOpacity(0.1)),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              '$_personCounter',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.purple.withOpacity(0.1)),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      
                      
                      
                      
                      
                      
                      ],
                    ),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[

                        Text('Tip', style: TextStyle(color: Colors.grey.shade700),
                        ),

                        Text('\$' + 
                              '${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage )).toStringAsFixed(2)}',
                          style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),

                          ),
                          
                      ],
                    ),
                  
                   Column(

                     children: <Widget>[

                       Text('$_tipPercentage%', 
                       style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),

                          ),

                       Slider(

                        min: 0,
                        max: 100,

                        activeColor: Colors.purple,
                        inactiveColor: Colors.grey,
                        divisions: 10,

                        
                        value:_tipPercentage.toDouble(), 
                        onChanged:(double newValue) {

                          setState(() {
                            
                            _tipPercentage = newValue.round();


                          });





                        },
                        
                        
                     )



                     ],


                   )


                  
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    
    );
  }


  calculateTotalTip(double billAmount,  int splitBy, int tipPercentage) {

    double totalTip = 0.0;
    
    if(billAmount < 0 || billAmount.toString().isEmpty) {

      print('Not Valid!');

      

    } else{

      totalTip = (billAmount * tipPercentage) / 100;



    }

    return totalTip;





  }

  
  calculateTotalPerPerson( double billAmount,  int splitBy, int tipPercentage) {


    var totalPerPerson = ( calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;

    return totalPerPerson.toStringAsFixed(2);





  }
  




}
