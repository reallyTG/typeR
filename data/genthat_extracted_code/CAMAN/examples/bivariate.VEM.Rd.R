library(CAMAN)


### Name: bivariate.VEM
### Title: VEM algorithm for univariate data, for bivariate data and for
###   meta data
### Aliases: bivariate.VEM
### Keywords: datasets

### ** Examples

## Not run: 
##D # 1.	VEM-algorithm  for bivariate normally distributed data 
##D #Examples
##D data(rs12363681)
##D bivariate.VEM(obs1=x,obs2=y,type="bi", data=rs12363681,startk=20)
##D # 2.VEM for metadata
##D data(CT)
##D bivariate.VEM(obs1=logitTPR, obs2=logitTNR, 
##D               var1=varlogitTPR, var2= varlogitTNR,
##D               type="meta", data=CT, startk=20)
## End(Not run)



