library(polySegratio)


### Name: makeLabel
### Title: Generate labels from two columns where blanks in first column
###   are replaced by preceding non-blank label
### Aliases: makeLabel
### Keywords: manip category

### ** Examples


  ## imaginary data frame representing ceq marker names read in from
  ## spreadsheet
  x <- data.frame( col1 = c("agc","","","","gct5","","ccc","",""),
                   col2 = c(1,3,4,5,1,2,2,4,6))
  print(x)
  print(makeLabel(x))
  print(cbind(x,lab=makeLabel(x, sep=".")))



