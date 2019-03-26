library(survey)


### Name: withReplicates
### Title: Compute variances by replicate weighting
### Aliases: withReplicates withReplicates.svyrep.design
###   withReplicates.svrepvar withReplicates.svrepstat
### Keywords: survey

### ** Examples

data(scd)
repweights<-2*cbind(c(1,0,1,0,1,0), c(1,0,0,1,0,1), c(0,1,1,0,0,1),
c(0,1,0,1,1,0))
scdrep<-svrepdesign(data=scd, type="BRR", repweights=repweights)

a<-svyratio(~alive, ~arrests, design=scdrep)
print(a$ratio)
print(a$var)
withReplicates(scdrep, quote(sum(.weights*alive)/sum(.weights*arrests)))
withReplicates(scdrep, function(w,data)
sum(w*data$alive)/sum(w*data$arrests))

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
rclus1<-as.svrepdesign(dclus1)
varmat<-svyvar(~api00+api99+ell+meals+hsg+mobility,rclus1,return.replicates=TRUE)
withReplicates(varmat, quote( factanal(covmat=.replicate, factors=2)$unique) )


data(nhanes)
nhanesdesign <- svydesign(id=~SDMVPSU, strata=~SDMVSTRA, weights=~WTMEC2YR, nest=TRUE,data=nhanes)
logistic <- svyglm(HI_CHOL~race+agecat+RIAGENDR, design=as.svrepdesign(nhanesdesign),
family=quasibinomial, return.replicates=TRUE)
fitted<-predict(logistic, return.replicates=TRUE, type="response")
sensitivity<-function(pred,actual) mean(pred>0.1 & actual)/mean(actual)
withReplicates(fitted, sensitivity, actual=logistic$y)

## Not run: 
##D library(quantreg)
##D data(api)
##D ## one-stage cluster sample
##D dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
##D ## convert to bootstrap
##D bclus1<-as.svrepdesign(dclus1,type="bootstrap", replicates=100)
##D 
##D ## median regression
##D withReplicates(bclus1, quote(coef(rq(api00~api99, tau=0.5, weights=.weights))))
## End(Not run)



