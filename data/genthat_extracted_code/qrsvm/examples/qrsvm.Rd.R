library(qrsvm)


### Name: qrsvm
### Title: Fits a quantile regression SVM based on the Pinball Loss
### Aliases: qrsvm

### ** Examples

n<-200

x<-as.matrix(seq(-1.5,1.5,length.out = n))
y<-rnorm(n)*(0.3+abs(sin(x)))

plot(x,y)

mod005<-qrsvm(x,y, tau=0.05)
mod095<-qrsvm(x,y, tau=0.95)
lines(x, mod005$fitted, col="red")
lines(x, mod095$fitted, col="red")



