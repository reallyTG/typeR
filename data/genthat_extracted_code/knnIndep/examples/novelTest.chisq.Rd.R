library(knnIndep)


### Name: novelTest.chisq
### Title: A novel test of independence
### Aliases: novelTest.chisq

### ** Examples

set.seed(10)
xylist = generate.benchmark.data(7,.3,100)
x = runif(100)
novelTest.chisq(x,xylist$y,maxi=20)
novelTest.chisq(xylist$x,xylist$y,maxi=20)



