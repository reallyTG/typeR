library(bcp)


### Name: lombard
### Title: Milling machine indentation data
### Aliases: lombard
### Keywords: datasets

### ** Examples

 
## Not run: 
##D data(lombard)
##D # univariate change point analysis
##D bcp.model <- bcp(lombard, burnin=500, mcmc=5000, return.mcmc=TRUE)
##D 
##D # linear model change point analysis 
##D bcpr.model <- bcp(lombard, cbind(1:100), burnin=500, mcmc=5000, return.mcmc=TRUE)
##D 
##D plot(bcp.model, main="Lombard Milling Data")
##D plot(bcpr.model, main="Lombard Milling Data (with Regression Model)")
## End(Not run)



