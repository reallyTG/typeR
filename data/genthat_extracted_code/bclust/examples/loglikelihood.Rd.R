library(bclust)


### Name: loglikelihood
### Title: computes the model log likelihood useful for estimation of the
###   transformed.par
### Aliases: loglikelihood

### ** Examples

data(gaelle)
gaelle.id<-rep(1:14,c(3,rep(4,13))) 
# first 3 rows replication of ColWT, 4 for the rest

mc.gaelle<-meancss(gaelle,gaelle.id)

optimfunc<-function(theta)
{
-loglikelihood(x.mean=mc.gaelle$mean,x.css=mc.gaelle$css,
repno=mc.gaelle$repno,transformed.par=theta)#compute - log likelihood
}

transpar<-optim(rep(0,6),optimfunc,method="BFGS")$par 
#gives argmin(-loglikelihood)
#put a vector of correct length for the evaluation of the likelihood

plot(bclust(gaelle,transformed.par=transpar))

        


