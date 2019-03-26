library(multimode)


### Name: modetest
### Title: Test for the number of modes
### Aliases: modetest
### Keywords: mode testing

### ** Examples

# Testing for unimodality
data(geyser)
data=geyser
modetest(data)
## Not run: 
##D # Testing bimodality using B=100 bootstrap replicas
##D modetest(data,mod0=2,B=100)
##D #There is no evidence to reject the null hypothesis of bimodality
##D locmodes(data,mod0=2,display=TRUE)
## End(Not run)



