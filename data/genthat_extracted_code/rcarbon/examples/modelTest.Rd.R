library(rcarbon)


### Name: modelTest
### Title: Monte-Carlo simulation test for SPDs
### Aliases: modelTest

### ** Examples

## Example with Younger Dryas period Near East, including site bins
## Not run: 
##D data(emedyd)
##D caldates <- calibrate(x=emedyd$CRA, errors=emedyd$Error, normalised=FALSE, calMatrix=TRUE)
##D bins <- binPrep(sites=emedyd$SiteName, ages=emedyd$CRA, h=50)
##D nsim=5 #toy example
##D expnull <- modelTest(caldates, errors=emedyd$Error, bins=bins, nsim=nsim, runm=50,
##D timeRange=c(16000,9000), model="exponential", datenormalised=FALSE)
##D plot(expnull, xlim=c(16000,9000))
##D round(expnull$pval,4) #p-value
##D summary(expnull)
## End(Not run)



