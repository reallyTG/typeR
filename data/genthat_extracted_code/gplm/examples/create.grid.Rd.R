library(gplm)


### Name: create.grid
### Title: Create a grid for kernel estimation
### Aliases: create.grid
### Keywords: smooth

### ** Examples

  v1 <- 1:5
  v2 <- 3:1
  grid <- create.grid(list(v1,v2))

  x <- matrix(rnorm(60),30,2)
  v1 <- seq(min(x[,1]),max(x[,1]),length=10)
  v2 <- seq(min(x[,2]),max(x[,2]),length=5)
  grid <- create.grid(list(v1,v2))



