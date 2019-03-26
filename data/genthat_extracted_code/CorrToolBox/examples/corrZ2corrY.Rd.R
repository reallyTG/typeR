library(CorrToolBox)


### Name: corrZ2corrY
### Title: Computation of the Correlation of Bivariate Nonnormal Variables
###   from the Correlation of Bivariate Standard Normal Variables
### Aliases: corrZ2corrY

### ** Examples

set.seed(987)
library(moments)

y1<-rweibull(n=100000, scale=1, shape=1)
y1.skew<-round(skewness(y1), 5)
y1.exkurt<-round(kurtosis(y1)-3, 5)

gaussmix <- function(n,m1,m2,s1,s2,pi) {
  I <- runif(n)<pi
  rnorm(n,mean=ifelse(I,m1,m2),sd=ifelse(I,s1,s2))
}
y2<-gaussmix(n=100000, m1=0, s1=1, m2=3, s2=1, pi=0.5)
y2.skew<-round(skewness(y2), 5)
y2.exkurt<-round(kurtosis(y2)-3, 5)

corrZ2corrY(corrZ=-0.849, skew.vec=c(y1.skew, y2.skew), kurto.vec=c(y1.exkurt, y2.exkurt))



