library(CorrToolBox)


### Name: tet2phi
### Title: Computation of the Phi Coefficient from the Tetrachoric
###   Correlation
### Aliases: tet2phi

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

tet2phi(tetcorr=-0.4, 
        dist1=list(skewness=y1.skew, exkurtosis=y1.exkurt, p=0.85), 
        dist2=list(skewness=y2.skew, exkurtosis=y2.exkurt, p=0.15))

tet2phi(tetcorr=0.7, 
        dist1=list(skewness=y1.skew, exkurtosis=y1.exkurt, p=0.10), 
        dist2=list(skewness=y2.skew, exkurtosis=y2.exkurt, p=0.30))



