library(mglmn)


### Name: ses.maglm
### Title: Standardized effect size of relative importance values for
###   mamglm
### Aliases: ses.maglm
### Keywords: ~kwd1 ~kwd2

### ** Examples

#load species composition and environmental data
data(capcay)
adj.sr <- capcay$adj.sr
#use a subset of data in this example to reduce run time
env_sp <- capcay$env_sp[,1:5]

#to execute calculations on a single core:
ses.maglm(data=env_sp, y="adj.sr", par=FALSE,family="gaussian", runs=4)

## Not run: 
##D #to execute parallel calculations:
##D sfInit(parallel=TRUE, cpus=4)
##D sfExportAll()
##D ses.maglm(data=env_sp, y="adj.sr", par=TRUE,family="gaussian", runs=4)
## End(Not run)




