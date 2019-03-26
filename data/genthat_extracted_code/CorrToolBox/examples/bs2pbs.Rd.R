library(CorrToolBox)


### Name: bs2pbs
### Title: Computation of the Point-Biserial Correlation from the Biserial
###   Correlation
### Aliases: bs2pbs

### ** Examples

set.seed(123)
y1<-rweibull(n=100000, scale=1, shape=1.2)

gaussmix <- function(n,m1,m2,s1,s2,pi) {
  I <- runif(n)<pi
  rnorm(n,mean=ifelse(I,m1,m2),sd=ifelse(I,s1,s2))
}
y2<-gaussmix(n=100000, m1=0, s1=1, m2=3, s2=1, pi=0.6)

bs2pbs(bs=0.6, bin.var=y1, cont.var=y2, p=0.55)
bs2pbs(bs=0.6, bin.var=y1, cont.var=y2, cutpoint=0.65484)



