library(mglmn)


### Name: ses.mamglm
### Title: Standardized effect size of relative importance values for
###   mamglm
### Aliases: ses.mamglm
### Keywords: ~kwd1 ~kwd2

### ** Examples

#load species composition and environmental data
data(capcay)
#use a subset of data in this example to reduce run time
env_assem <- capcay$env_assem[,1:5]
pre.abs0 <- capcay$abund
pre.abs0[pre.abs0>0] = 1
pre.abs <- mvabund(pre.abs0)

#to execute calculations on a single core:
ses.mamglm(data=env_assem,y="pre.abs", par=FALSE, family="binomial",AIC.restricted=FALSE,runs=4)


## Not run: 
##D #to execute parallel calculations:
##D sfInit(parallel=TRUE, cpus=4)
##D sfExportAll()
##D ses.mamglm(data=env_assem,y="pre.abs", par=TRUE, family="binomial",AIC.restricted=FALSE,runs=4)
## End(Not run)




