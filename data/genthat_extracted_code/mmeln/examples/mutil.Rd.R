library(mmeln)


### Name: plot.mmeln,logLik.mmeln,anova.mmeln,print.mmeln
### Title: Utility methods for objects of class mmeln
### Aliases: plot.mmeln logLik.mmeln anova.mmeln print.mmelnSOL cov.tsf
###   multnm
### Keywords: mmeln mixture normal multivariate

### ** Examples


#### load an example.
data(exY)

### estimation of the parameters of the mixture
temps=1:3
mmeln1=mmeln(Y,G=2,form.loc=~factor(temps)-1,form.mel=~1,cov="CS")
mmeln2=mmeln(Y,G=2,form.loc=list(~temps,~I((temps-2)^2)),form.mel=~1,cov="CS")

mix1=estim(mmeln1,mu=list(rep(1,3),rep(2,3)),tau=c(0)
          ,sigma=list(c(1,.4),c(1,.4)),iterlim=100,tol=1e-6)

mix2=estim(mmeln2,mu=list(c(2,1),c(5,-1)),tau=c(0)
          ,sigma=list(c(1,.4),c(1,.4)),iterlim=100,tol=1e-6)


mix1
mix2

anova(mix1,mix2)
plot(mix1,main="Mixture of multivariate normal")
plot(mix2,main="Mixture of multivariate normal")



