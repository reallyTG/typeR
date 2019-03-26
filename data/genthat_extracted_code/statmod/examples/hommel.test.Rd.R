library(statmod)


### Name: hommel.test
### Title: Test Multiple Comparisons Using Hommel's Method
### Aliases: hommel.test
### Keywords: htest

### ** Examples

p <- sort(runif(100))[1:10]
cbind(p,p.adjust(p,"hommel"),hommel.test(p))



