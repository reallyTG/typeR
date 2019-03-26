library(binomSamSize)


### Name: coverage
### Title: Calculate coverage probability for a binomial proportion
###   confidence interval scheme
### Aliases: coverage plot.coverage
### Keywords: design survey

### ** Examples

#Show coverage of Liu & Bailey interval
cov <- coverage( binom.liubailey, n=100, alpha=0.05,
           p.grid=seq(0,1,length=1000), interval=c(0,1), lambda=0, d=0.1)
plot(cov, type="l")

#Now for some more advanced stuff. Investigate coverage of pooled
#sample size estimators
kk <- 10
nn <- 20
ci.funs <- list(poolbinom.wald, poolbinom.logit, poolbinom.lrt)
covs <- lapply( ci.funs, function(f) {
 coverage( f, n=nn, k=kk, alpha=0.05, p.grid=seq(0,1,length=100),
pmfX=function(k,n,p) dbinom(k,size=n, p=1-(1-p)^kk))
})

par(mfrow=c(3,1))
plot(covs[[1]],type="l",main="Wald",ylim=c(0.8,1))
lines(c(0,1),rep(0.95,2),lty=2,col=2)
plot(covs[[2]],type="l",main="Logit")#,ylim=c(0.8,1))
lines(c(0,1),rep(0.95,2),lty=2,col=2)
plot(covs[[3]],type="l",main="LRT",ylim=c(0.8,1))
lines(c(0,1),rep(0.95,2),lty=2,col=2)

poolbinom.wald(x=1,n=nn,k=kk)
poolbinom.logit(x=1,n=nn,k=kk)
poolbinom.lrt(x=1,n=nn,k=kk)




