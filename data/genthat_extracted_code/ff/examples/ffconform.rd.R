library(ff)


### Name: ffconform
### Title: Get most conforming argument
### Aliases: ffconform
### Keywords: IO data

### ** Examples

  a <- ff(1:10)
  b <- clone(a)
  c <- ff(1:20)
  d <- ff(1:21)
  ffconform(a,b)
  ffconform(c,a)
  ffconform(a,c)
  ffconform(c,a,b)

  d1 <- ff(1:20, dim=c(2,10))
  d2 <- ff(1:20, dim=c(10,2))
  ffconform(c,d1)
  ffconform(c,d2)
  ffconform(d1,c)
  ffconform(d2,c)
  try(ffconform(d1,d2))
  ffconform(d1,d1)

  rm(a,b,c,d1,d2); gc()



