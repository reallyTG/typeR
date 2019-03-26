library(dga)


### Name: cfunction
### Title: A Helper Function for make.strata
### Aliases: cfunction
### Keywords: stratification

### ** Examples


## The function is currently defined as
cfunction <- function(x, nlist){
  out <- table(c(x, 0:(2^nlist-1)))-1
}



