library(broman)


### Name: mypairs
### Title: My scatterplot matrix
### Aliases: mypairs
### Keywords: hplot

### ** Examples

v <- rbind(c(1,0.5,0.2),c(0.5,1,0.9),c(0.2,0.9,1))
x <- rmvn(500, rep(5,3), v)
mypairs(x, col=sample(c("blue","red"), 500, repl=TRUE))




