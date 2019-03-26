library(jvcoords)


### Name: whiten
### Title: Whiten data
### Aliases: whiten

### ** Examples

  w <- whiten(iris[, 1:4])
  colMeans(w$y)
  round(cov(w$y), 3)



