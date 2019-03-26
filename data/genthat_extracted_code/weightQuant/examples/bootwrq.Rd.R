library(weightQuant)


### Name: bootwrq
### Title: Bootstrap procedure for weighted quantile regressions
### Aliases: bootwrq

### ** Examples

## Not run: 
##D ## computation of the weights with intermittent missing data 
##D w_simdata <- weightsIMD(data=simdata,Y="Y",X1="X",X2=NULL,subject="id",
##D death="death",time="time",impute=20,name="w_imd")$data
##D 
##D ## estimation of the weighted quantile regressions
##D ## for the first quartile and the median
##D m_simdata <- rq(Y~time*X,data=w_simdata,weights=w_imd,tau=c(0.25,0.5))
##D 
##D ## estimation of the standard erros using the bootstrap procedure
##D boot_simdata <- bootwrq(B=1000, form=Y~time*X, tau=c(0.25,0.5),
##D data=w_simdata, Y="Y",X1="X",X2=NULL,subject="id",
##D death="death",time="time",impute=20,wcompute=0,intermittent=TRUE)
##D 
##D ## the summary of the results
##D summary(boot_simdata,m_simdata)
##D 
##D ## comparison of the covariate effects
##D ## between the first quartile and the median
##D test.bootwrq(boot_simdata,m_simdata)
## End(Not run)



