library(simr)


### Name: powerCurve
### Title: Estimate power at a range of sample sizes.
### Aliases: powerCurve

### ** Examples

## Not run: 
##D fm <- lmer(y ~ x + (1|g), data=simdata)
##D pc1 <- powerCurve(fm)
##D pc2 <- powerCurve(fm, breaks=c(4,6,8,10))
##D print(pc2)
##D plot(pc2)
## End(Not run)




