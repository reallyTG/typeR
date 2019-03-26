library(R.utils)


### Name: dimNA< -
### Title: Sets the dimension of an object with the option to infer one
###   dimension automatically
### Aliases: 'dimNA< -.default' 'dimNA< -' dimNA<- dimNA<-.default
### Keywords: file IO

### ** Examples

  x <- 1:12
  dimNA(x) <- c(2,NA,3)
  stopifnot(dim(x) == as.integer(c(2,2,3)))



