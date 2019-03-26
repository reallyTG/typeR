library(party)


### Name: Transformations
### Title: Function for Data Transformations
### Aliases: ptrafo ff_trafo
### Keywords: manip

### ** Examples


  ### rank a variable
  ptrafo(data.frame(y = 1:20), 
         numeric_trafo = function(x) rank(x, na.last = "keep"))

  ### dummy coding of a factor
  ptrafo(data.frame(y = gl(3, 9)))




