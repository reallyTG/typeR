library(DetR)


### Name: DetMM
### Title: Robust and Deterministic Linear Regression via DetMM
### Aliases: DetMM
### Keywords: multivariate robust deterministic

### ** Examples

## generate data
set.seed(1234)  # for reproducibility
n<-100
h<-c(55,76,89)
set.seed(123)
x0<-matrix(rnorm(n*2),nc=2)
y0<-rnorm(n)
out1<-DetMM(x0,y0,h=h)



