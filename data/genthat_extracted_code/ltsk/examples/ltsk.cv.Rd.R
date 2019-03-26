library(ltsk)


### Name: ltsk.cv
### Title: Local Time and Space Kriging Cross Validation, n-Fold or
###   Leave-one-out
### Aliases: ltsk.cv

### ** Examples

## load the data
set.seed(123)
data(epa_cl)
ii= with(obs,which(amonth==5 & aday <13)) ## first week of Januray 2005;
x=obs[sample(ii,400),]
## apply log transformation
x[,'pr_pm25'] = log(x[,'pr_pm25'])
## run kriging
out <- ltsk.cv(nfold=10,obs=x,th=c(0.10,10),nbins=c(2,2),zcoord='pr_pm25',verbose=FALSE,cl=0)



