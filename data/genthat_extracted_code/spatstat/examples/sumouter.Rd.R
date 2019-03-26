library(spatstat)


### Name: sumouter
### Title: Compute Quadratic Forms
### Aliases: sumouter quadform bilinearform
### Keywords: array

### ** Examples

  x <- matrix(1:12, 4, 3)
  dimnames(x) <- list(c("Wilma", "Fred", "Barney", "Betty"), letters[1:3])
  x

  sumouter(x)

  w <- 4:1
  sumouter(x, w)
  v <- matrix(1, 3, 3)
  quadform(x, v)

  # should be the same as quadform(x, v)
  bilinearform(x, v, x)

  # See what happens with NA's
  x[3,2] <- NA
  sumouter(x, w)
  quadform(x, v)



