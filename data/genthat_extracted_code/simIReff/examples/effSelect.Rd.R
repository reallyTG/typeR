library(simIReff)


### Name: effSelect
### Title: Model Selection for Effectiveness Distributions
### Aliases: effSelect which.effSelect logLik.eff

### ** Examples

ee <- effContFit(web2010ap[,5])
e <- effSelect(ee, method = "BIC")
e2 <- ee[[which.effSelect(ee, method = "BIC")]] # same as e

logLik(e)
AIC(e, k=4)
BIC(e)



