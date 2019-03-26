library(memisc)


### Name: items
### Title: Survey Items
### Aliases: item items item-class item.vector-class integer.item-class
###   double.item-class numeric.item-class character.item-class
###   datetime.item-class Date.item-class as.item as.item,numeric-method
###   as.item,logical-method as.item,character-method as.item,factor-method
###   as.item,ordered-method as.item,POSIXct-method as.item,Date-method
###   as.item,double.item-method as.item,integer.item-method
###   as.item,character.item-method as.item,datetime.item-method
###   as.item,Date.item-method [,item.vector,numeric,missing,missing-method
###   [,item.vector,logical,missing,missing-method str.double.item
###   str.integer.item str.character.item str.datetime.item
###   unique,item.vector-method as.data.frame.character.item
###   as.data.frame.double.item as.data.frame.integer.item
###   as.vector,item-method as.numeric,item-method as.integer,item-method
###   as.factor,item.vector-method as.ordered,item.vector-method
###   as.character,item.vector-method as.character,datetime.item-method
###   as.character,Date.item-method summary,item.vector-method
###   summary,datetime.item-method summary,Date.item-method
###   format,item.vector-method show,item.vector-method
###   format,datetime.item-method format,Date.item-method
###   show,datetime.item-method show,Date.item-method
###   print,item.vector-method print,datetime.item-method
###   print,Date.item-method Compare,numeric.item,character-method
###   Compare,character,numeric.item-method
###   Arith,numeric.item,numeric.item-method
###   Arith,numeric.item,numeric-method Arith,numeric,numeric.item-method
###   Math,numeric.item-method Math2,numeric.item-method
###   Summary,numeric.item-method %in%,numeric.item,character-method
###   rep,item.vector-method weighted.mean,item.vector-method
### Keywords: manip

### ** Examples

  x <- as.item(rep(1:5,4),
      labels=c(
          "First"      = 1,
          "Second"     = 2,
          "Third"      = 3,
          "Fourth"     = 4,
          "Don't know" = 5
        ),
      missing.values=5,
      annotation = c(
        description="test"
      ))
  str(x)
  summary(x)
  as.numeric(x)

  test <- as.item(rep(1:6,2),labels=structure(1:6,
                                      names=letters[1:6]))
  test
  test == 1
  test != 1
  test == "a"
  test != "a"
  test == c("a","z")
  test != c("a","z")
  test 
  test 

  codebook(test)

  Test <- as.item(rep(letters[1:6],2),
                    labels=structure(letters[1:6],
                                     names=LETTERS[1:6]))
  Test
  Test == "a"
  Test != "a"
  Test == "A"
  Test != "A"
  Test == c("a","z")
  Test != c("a","z")
  Test 
  Test 

  as.factor(test)
  as.factor(Test)
  as.numeric(test)
  as.character(test)
  as.character(Test)

  as.data.frame(test)[[1]]



