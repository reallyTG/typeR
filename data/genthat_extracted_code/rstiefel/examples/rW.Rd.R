library(rstiefel)


### Name: rW
### Title: Simulate 'W' as Described in Wood(1994)
### Aliases: rW

### ** Examples


rW(pi,4)

## The function is currently defined as
function (kap, m) 
{
    .C("rW", kap = as.double(kap), m = as.integer(m), w = double(1))$w
  }




