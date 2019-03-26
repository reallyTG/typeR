library(malariaAtlas)


### Name: getPR
### Title: Download PR points from the MAP database
### Aliases: getPR

### ** Examples

#Download PfPR data for Nigeria and Cameroon and map the locations of these points using autoplot
## No test: 
NGA_CMR_PR <- getPR(country = c("Nigeria", "Cameroon"), species = "Pf")
autoplot(NGA_CMR_PR)

#Download PfPR data for Madagascar and map the locations of these points using autoplot
Madagascar_pr <- getPR(ISO = "MDG", species = "Pv")
autoplot(Madagascar_pr)

getPR(country = "ALL", species = "BOTH")
## End(No test)





