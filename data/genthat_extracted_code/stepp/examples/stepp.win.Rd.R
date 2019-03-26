library(stepp)


### Name: stepp.win
### Title: The constructor to create the stepp window object
### Aliases: stepp.win
### Keywords: ~kwd1 ~kwd2

### ** Examples

  # create a stepp window object of type "sliding", 
  # subpopulation size is 200 and allows only 50 patients
  # between overlapping windows
  mywin <- stepp.win(type="sliding", r1=50, r2=200)

  # print a summary of the stepp window object
  summary(mywin) 



