library(DetR)


### Name: DetLTS
### Title: Robust and Deterministic Linear Regression via DetLTS
### Aliases: DetLTS
### Keywords: multivariate robust deterministic

### ** Examples

n<-100
h<-c(55,76,89)
set.seed(123)# for reproducibility
x0<-matrix(rnorm(n*2),nc=2)
y0<-rnorm(n)
out1<-DetLTS(x0,y0,h=h)



