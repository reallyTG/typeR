library(futile.any)


### Name: anynames
### Title: Get the useful names of a data structure
### Aliases: anynames anynames<-
### Keywords: attribute

### ** Examples

  m <- matrix(c(1,2,3,4,5,6), ncol=2)
  anynames(m) <- c('a','b')
  anynames(m)

  v <- c(a=1,b=2,c=3,d=4,e=5)
  anynames(v)

  l <- list(a=1,b=2,c=3,d=4,e=5)
  anynames(l)



