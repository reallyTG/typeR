library(tsDyn)


### Name: TVECM.SeoTest
### Title: No cointegration vs threshold cointegration test
### Aliases: TVECM.SeoTest
### Keywords: ts

### ** Examples


# As the function takes long long time to be executed, we show in in don't run environement
## Not run: 
##D data(zeroyld)
##D 
##D #can be useful to check whether the bootstrap is working: 
##D #without sampling, results of boot should be same as original
##D #this is indeed not always the case duye to floating point algorithm
##D TVECM.SeoTest(zeroyld,lag=2, beta=1, trim=0.1,nboot=2, plot=FALSE,check=TRUE)
##D 
##D #then run the function:
##D TVECM.SeoTest(zeroyld,lag=2, beta=1, trim=0.1,nboot=100, plot=FALSE,check=FALSE)
## End(Not run)




