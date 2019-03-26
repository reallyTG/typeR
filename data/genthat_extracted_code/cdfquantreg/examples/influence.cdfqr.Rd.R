library(cdfquantreg)


### Name: influence.cdfqr
### Title: Influence Diagnosis For Fitted Cdfqr Object
### Aliases: influence.cdfqr dfbeta.cdfqr dfbetas.cdfqr influence.cdfqrH
###   dfbeta.cdfqrH dfbetas.cdfqrH

### ** Examples

data(cdfqrExampleData)
fit <- cdfquantreg(crc99 ~ vert | confl, 't2', 't2', data = JurorData)
#It takes some time especially the data is large.
influcne <- influence(fit)
plot(influcne[,2])

## Not run: 
##D # Same as influence(fit)
##D dfbetval <- dfbetas(fit)
## End(Not run)




