library(dga)


### Name: sfunction
### Title: A Helper Function for make.strata.
### Aliases: sfunction
### Keywords: stratification

### ** Examples



## The function is currently defined as
sfunction <- function(x){
  out <- apply(x, 2, sum)
}



