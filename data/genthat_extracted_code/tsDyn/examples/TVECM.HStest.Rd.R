library(tsDyn)


### Name: TVECM.HStest 
### Title: Test of linear cointegration vs threshold cointegration
### Aliases: 'TVECM.HStest '
### Keywords: ts

### ** Examples

#Use original data from paper:
data(zeroyld)
dataPaper<-zeroyld
# Test: nboot, number of bootstrap replications, should be high 
## Not run: 
##D test1<-TVECM.HStest(dataPaper, lag=1, intercept=TRUE, nboot=1000)
## End(Not run)

#we use here for the example a much smaller number of bootstrap:
test1<-TVECM.HStest(dataPaper, lag=1, intercept=TRUE, nboot=10)

test1
summary(test1)
plot(test1)

#can have only specific plots:
plot(test1, which="LM values")
plot(test1, which="Density")

## Run the function in parallel:
## Not run: 
##D #we show here the use with package doMC
##D library(doMC)
##D registerDoMC(2) #Number of cores
##D test1<-TVECM.HStest(dataPaper, lag=1, intercept=TRUE, nboot=1000, hpc="foreach")
## End(Not run)




