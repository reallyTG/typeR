library(survey)


### Name: svymle
### Title: Maximum pseudolikelihood estimation in complex surveys
### Aliases: svymle print.svymle coef.svymle summary.svymle vcov.svymle
### Keywords: survey models optimize

### ** Examples


 data(api)

 dstrat<-svydesign(id=~1, strata=~stype, weight=~pw, fpc=~fpc, data=apistrat)

 ## fit with glm
 m0 <- svyglm(api00~api99+ell,family="gaussian",design=dstrat)
 ## fit as mle (without gradient)
 m1 <- svymle(loglike=dnorm,gradient=NULL, design=dstrat, 
    formulas=list(mean=api00~api99+ell, sd=~1),
    start=list(c(80,1,0),c(20)), log=TRUE)
 ## with gradient
 gr<- function(x,mean,sd,log){
	 dm<-2*(x - mean)/(2*sd^2)
	 ds<-(x-mean)^2*(2*(2 * sd))/(2*sd^2)^2 - sqrt(2*pi)/(sd*sqrt(2*pi))
         cbind(dm,ds)
      }
 m2 <- svymle(loglike=dnorm,gradient=gr, design=dstrat, 
    formulas=list(mean=api00~api99+ell, sd=~1),
    start=list(c(80,1,0),c(20)), log=TRUE, method="BFGS")

 summary(m0)
 summary(m1,stderr="model")
 summary(m2)

 ## Using offsets
 m3 <- svymle(loglike=dnorm,gradient=gr, design=dstrat, 
    formulas=list(mean=api00~api99+offset(ell)+ell, sd=~1),
    start=list(c(80,1,0),c(20)), log=TRUE, method="BFGS")



 ## More complicated censored lognormal data example
 ## showing that the response variable can be multivariate

 data(pbc, package="survival")
 pbc$randomized <- with(pbc, !is.na(trt) & trt>0)
 biasmodel<-glm(randomized~age*edema,data=pbc)
 pbc$randprob<-fitted(biasmodel)
 dpbc<-svydesign(id=~1, prob=~randprob, strata=~edema,
    data=subset(pbc,randomized))


## censored logNormal likelihood
 lcens<-function(x,mean,sd){
    ifelse(x[,2]==1,
           dnorm(log(x[,1]),mean,sd,log=TRUE),
           pnorm(log(x[,1]),mean,sd,log=TRUE,lower.tail=FALSE)
           )
 }

 gcens<- function(x,mean,sd){

        dz<- -dnorm(log(x[,1]),mean,sd)/pnorm(log(x[,1]),mean,sd,lower.tail=FALSE)

        dm<-ifelse(x[,2]==1,
                   2*(log(x[,1]) - mean)/(2*sd^2),
                   dz*-1/sd)
        ds<-ifelse(x[,2]==1,
                   (log(x[,1])-mean)^2*(2*(2 * sd))/(2*sd^2)^2 - sqrt(2*pi)/(sd*sqrt(2*pi)),
                   ds<- dz*-(log(x[,1])-mean)/(sd*sd))
        cbind(dm,ds)      
 }

m<-svymle(loglike=lcens, gradient=gcens, design=dpbc, method="newuoa",
      formulas=list(mean=I(cbind(time,status>0))~bili+protime+albumin,
                    sd=~1),
         start=list(c(10,0,0,0),c(1)))

summary(m)

## the same model, but now specifying the lower bound of zero on the
## log standard deviation

mbox<-svymle(loglike=lcens, gradient=gcens, design=dpbc, method="bobyqa",
      formulas=list(mean=I(cbind(time,status>0))~bili+protime+albumin,
                    sd=~1), lower=c(-Inf,-Inf,-Inf,-Inf,0), upper=Inf,
         start=list(c(10,0,0,0),c(1)))


## The censored lognormal model is now available in svysurvreg()

summary(svysurvreg(Surv(time,status>0)~bili+protime+albumin,
        design=dpbc,dist="lognormal"))

## compare svymle scale value after log transformation
svycontrast(m, quote(log(`sd.(Intercept)`)))






