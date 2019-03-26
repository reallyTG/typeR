library(rcarbon)


### Name: p2pTest
### Title: Point to point test of SPD
### Aliases: p2pTest

### ** Examples

## Example with Younger Dryas period Near East, including site bins
## Not run: 
##D data(emedyd)
##D caldates <- calibrate(x=emedyd$CRA, errors=emedyd$Error, normalised=FALSE, calMatrix=TRUE)
##D bins <- binPrep(sites=emedyd$SiteName, ages=emedyd$CRA, h=50)
##D nsim=10 #toy example
##D expnull <- modelTest(caldates, errors=emedyd$Error, bins=bins, nsim=nsim, runm=50,
##D timeRange=c(16000,9000), model="exponential", datenormalised=FALSE, raw=TRUE)
##D p2pTest(x=expnull,p1=13000,p2=12500) #non-interactive mode
##D p2pTest(x=expnull) #interactive mode
## End(Not run)



