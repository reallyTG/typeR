library(knnIndep)


### Name: novelTest.extreme
### Title: A novel test of independence
### Aliases: novelTest.extreme

### ** Examples

set.seed(10)
xylist = generate.benchmark.data(7,.3,50)
x = runif(50)
novelTest.extreme(x,xylist$y,maxi=20)
novelTest.extreme(xylist$x,xylist$y,maxi=20)



