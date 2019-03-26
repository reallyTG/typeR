library(HH)


### Name: normalApproxBinomial
### Title: Plots to illustrate Normal Approximation to the
###   Binomial-hypothesis tests or confidence intervals.
### Aliases: normalApproxBinomial
### Keywords: hplot

### ** Examples

NTplot(distribution.name="binomial", n=20, ylim=c(0,4.2), p1=.8)
NTplot(distribution.name="binomial", n=20, type="confidence", ylim=c(0,4.2))
## Not run: 
##D NTplot(distribution.name="binomial", n=20, zaxis=TRUE, z1axis=TRUE,
##D        p1=.8678, ylim=c(0, 5.2))
##D NTplot(p0=.4, p.hat=.65, p1=.7, distribution.name="binomial", n=15)
##D NTplot(p.hat=.65, distribution.name="binomial", n=15, type="confidence")
## End(Not run)
## Not run: 
##D  ## these are interactive and won't work in R CMD check
##D NTplot(distribution.name="binomial", n=20, ylim=c(0,4.2), p1=.8, shiny=TRUE)
##D NTplot(p0=.4, p.hat=.65, p1=.7, distribution.name="binomial", n=15, shiny=TRUE)
##D NTplot(p.hat=.65, distribution.name="binomial", n=15, type="confidence", shiny=TRUE)
## End(Not run)



