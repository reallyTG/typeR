library(AnnotationDbi)


### Name: print.probetable
### Title: Print method for probetable objects
### Aliases: print.probetable
### Keywords: print

### ** Examples

  a = as.data.frame(matrix(runif(1e6), ncol=1e3))
  class(a) = c("probetable", class(a))
  print(a)
  print(as.matrix(a[2:3, 4:6]))



