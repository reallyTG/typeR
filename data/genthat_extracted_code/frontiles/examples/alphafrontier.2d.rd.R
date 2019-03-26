library(frontiles)


### Name: alphafrontier.2d
### Title: Representation of alpha-quantile efficiency frontier for 1
###   output and 1 input
### Aliases: alphafrontier.2d
### Keywords: robust multivariate

### ** Examples

# 1st example
data(spain)
plot(y~x2,data=spain)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",
alpha=0.95,col='red',lty=2,add=TRUE)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="input",
alpha=0.95,col='royalblue',lty=3,add=TRUE)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="hyper",
alpha=0.95,col='green',lty=4,add=TRUE)
legend("topleft",title="alpha-quantile frontier; alpha=0.95",
legend=c("output direction","input direction","hyper direction"),lty=2:4,
col=c("red","royalblue","green"))

# 2nd example
plot(y~x2,data=spain)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),
type="output",alpha=1,add=TRUE)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",
alpha=0.95,col='blue',lty=2,add=TRUE)
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",
m=30,col='green',lty=3,add=TRUE)
legend("topleft",title="output direction", legend=c("FDH","alpha=0.95","m=30"),
lty=1:3,col=c("black","royalblue","green"))

# 3rd example
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",
confidence=TRUE,shade=TRUE,alpha=0.98)
title("Alpha-quantile frontier with alpha=0.98 and its confidence interval")



