library(rstiefel)


### Name: ry_bmf
### Title: Helper Function for Sampling a Bingham-von
###   Mises-Fisher-distributed Vector
### Aliases: ry_bmf

### ** Examples


## The function is currently defined as
function (y, l, d) 
{
    .C("ry_bmf", y = as.double(y), l = as.double(l), d = as.double(d), 
        n = as.integer(length(y)))$y
  }




