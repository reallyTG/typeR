library(CorrToolBox)


### Name: ophi2corrZ
### Title: Computation of the Correlation of Bivariate Standard Normal
###   Variables from the Ordinal Phi Coefficient
### Aliases: ophi2corrZ

### ** Examples

set.seed(567)
library(moments)

y1<-rweibull(n=100000, scale=1, shape=3.6)
y1.skew<-round(skewness(y1), 5)
y1.exkurt<-round(kurtosis(y1)-3, 5)

gaussmix <- function(n,m1,m2,s1,s2,pi) {
  I <- runif(n)<pi
  rnorm(n,mean=ifelse(I,m1,m2),sd=ifelse(I,s1,s2))
}
y2<-gaussmix(n=100000, m1=0, s1=1, m2=2, s2=1, pi=0.3)
y2.skew<-round(skewness(y2), 5)
y2.exkurt<-round(kurtosis(y2)-3, 5)

ophi2corrZ(ophi=-0.7, p1=c(0.4, 0.3, 0.2, 0.1), p2=c(0.2, 0.2, 0.6))



