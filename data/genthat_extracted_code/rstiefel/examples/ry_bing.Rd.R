library(rstiefel)


### Name: ry_bing
### Title: Helper Function for Sampling a Bingham-distributed Vector
### Aliases: ry_bing

### ** Examples


## The function is currently defined as
function (y, l) 
{
    .C("ry_bing", y = as.double(y), l = as.double(l), n = as.integer(length(y)))$y
  }




