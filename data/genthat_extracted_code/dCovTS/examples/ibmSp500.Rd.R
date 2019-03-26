library(dCovTS)


### Name: ibmSp500
### Title: Monthly returns of IBM and S&P 500 composite index
### Aliases: ibmSp500
### Keywords: datasets

### ** Examples

attach(ibmSp500)

series <- tail(ibmSp500[,2:3],400)
lseries <- log(series+1)
## Not run: 
##D mADCFplot(lseries,MaxLag=18)
##D mADCFplot(lseries^2,MaxLag=18)
##D acf(lseries,lag.max=18)
##D acf(lseries^2,lag.max=18)
## End(Not run)




