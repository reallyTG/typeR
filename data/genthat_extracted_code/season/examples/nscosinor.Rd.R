library(season)


### Name: nscosinor
### Title: Non-stationary Cosinor
### Aliases: nscosinor

### ** Examples
## No test: 
data(CVD)
# model to fit an annual pattern to the monthly cardiovascular disease data
f = c(12)
tau = c(10,50)
## Not run: 
##D res12 = nscosinor(data=CVD, response='adj', cycles=f, niters=5000,
##D          burnin=1000, tau=tau)
##D summary(res12)
##D plot(res12)
## End(Not run)
## End(No test)



