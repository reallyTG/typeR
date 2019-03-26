library(ff)


### Name: vw
### Title: Getting and setting virtual windows
### Aliases: vw vw<- vw.ff vw.default vw<-.ff_vector vw<-.ff_array
### Keywords: IO data array

### ** Examples

  x <- ff(1:26, names=letters)
  y <- x
  vw(x) <- c(0, 13, 13)
  vw(y) <- c(13, 13, 0)
  x
  y
  x[1] <- -1
  y[1] <- -2
  vw(x) <- NULL
  x[]

  z <- ff(1:24, dim=c(4,6), dimnames=list(letters[1:4], LETTERS[1:6]))
  z
  vw(z) <- rbind(c(1,1), c(2,4), c(1,1))
  z

  rm(x,y,z); gc()



