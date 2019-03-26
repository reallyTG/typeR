library(CorrToolBox)


### Name: ps2pps
### Title: Computation of the Point-Polyserial Correlation from the
###   Polyserial Correlation
### Aliases: ps2pps

### ** Examples

set.seed(234)
y1<-rweibull(n=100000, scale=1, shape=25)

gaussmix <- function(n,m1,m2,s1,s2,pi) {
  I <- runif(n)<pi
  rnorm(n,mean=ifelse(I,m1,m2),sd=ifelse(I,s1,s2))
}
y2<-gaussmix(n=100000, m1=0, s1=1, m2=2, s2=1, pi=0.5)

ps2pps(ps=0.6, ord.var=y1, cont.var=y2, cats=c(1,2,3,4), p=c(0.4, 0.3, 0.2, 0.1))
ps2pps(ps=0.6, ord.var=y1, cont.var=y2, cats=c(1,2,3,4), cutpoint=c(0.97341, 1.00750, 1.03421))



