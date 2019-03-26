library(simIReff)


### Name: eff
### Title: Effectiveness Distributions
### Aliases: eff deff peff qeff reff

### ** Examples

# sample distribution from AP scores
e <- effCont_beta(web2010ap[,1])
# pdf integrates to 1
integrate(deff, lower = 0, upper = 1, .eff = e)
# qeff (quantile) is the inverse of peff (cumulative)
qeff(peff(.2, e), e)
# random generation of 100 scores
r <- reff(100, e)



