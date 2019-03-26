library(futile.any)


### Name: futile.any-package
### Title: Futile library to provide some polymorphism
### Aliases: futile.any-package futile.any
### Keywords: package attribute logic

### ** Examples

  m <- matrix(c(1,2,3,4,5,6), ncol=2)
  anylength(m)

  v <- c(1,2,3,4,5)
  anylength(v)

  m <- matrix(c(1,2,3,4,5,6), ncol=2)
  anynames(m) <- c('d','e')
  anynames(m)

  v <- c(a=1,b=2,c=3,d=4,e=5)
  anynames(v)

  l <- list(a=1,b=2,c=3,d=4,e=5)
  anynames(l)



