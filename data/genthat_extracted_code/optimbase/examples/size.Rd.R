library(optimbase)


### Name: size
### Title: Vector, Matrix or Data.Frame Size
### Aliases: size
### Keywords: method

### ** Examples

  a <- 1
  b <- letters[1:6]
  c <- matrix(1:20,nrow=4,ncol=5)
  d <- array(1:40, dim=c(2,5,2,2))
  e <- data.frame(a,b)
  f <- list(a,b,c,d,e)

  size(NULL) # 0 0
  size(NA)   # 1 1
  size(a)    # 1 1
  size(b,2)  # 6
  size(c)    # 4 5
  size(d)    # 2 5 2 2
  size(e,3)  # NA
  size(f)



