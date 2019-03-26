library(magic)


### Name: subsums
### Title: Sums of submatrices
### Aliases: subsums
### Keywords: array

### ** Examples

  data(Ollerenshaw)
  subsums(Ollerenshaw,c(2,2))
  subsums(Ollerenshaw[,1:10],c(2,2))
  subsums(Ollerenshaw, matrix(c(0,6),2,2)) # effectively, is.bree.correct()

  # multidimensional example.  
  a <- array(1,c(3,4,2))
  subsums(a,2)             # note that p=2 is equivalent to p=c(2,2,2);
                           # all elements should be identical

  subsums(a,2,wrap=FALSE)  #note "middle" elements > "outer" elements


  #Example of nondefault function:
  x <- matrix(1:42,6,7)
  subsums(x,2,func="max",pad=Inf,wrap=TRUE)  
  subsums(x,2,func="max",pad=Inf,wrap=FALSE)



