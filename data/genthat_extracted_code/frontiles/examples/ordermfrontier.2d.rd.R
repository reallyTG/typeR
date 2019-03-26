library(frontiles)


### Name: ordermfrontier.2d
### Title: Representation of m-order efficiency frontier for 1 output and 1
###   input
### Aliases: ordermfrontier.2d
### Keywords: robust multivariate

### ** Examples

# 1st example
data(spain)
plot(y~x2,data=spain)
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",m=30,
col='red',lty=2,add=TRUE)
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="input",m=30,
col='royalblue',lty=3,add=TRUE)
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="hyper",m=30,
col='green',lty=4,add=TRUE)
legend("topleft",
legend=c("output direction","input direction","hyper direction"),
lty=2:4,col=c("red","royalblue","green"))

# 2nd example
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",
confidence=TRUE,shade=TRUE,m=30)



