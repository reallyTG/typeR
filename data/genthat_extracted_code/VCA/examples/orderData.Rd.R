library(VCA)


### Name: orderData
### Title: Re-Order Data.Frame.
### Aliases: orderData

### ** Examples

## Not run: 
##D # random ordering
##D data(dataEP05A2_1)
##D dat <- dataEP05A2_1
##D levels(dat$day) <- sample(levels(dat$day))
##D # this has direct impact e.g. on order of estimated effects
##D fit <- anovaVCA(y~day/run, dat, order.data=FALSE)
##D ranef(fit)
##D # to guarantee consistent analysis results
##D # independent of the any data orderings option
##D # 'order.data' is per default set to TRUE:
##D fit <- anovaVCA(y~day/run, dat)
##D ranef(fit)
##D # which is identical to:
##D fit2 <- anovaVCA(y~day/run, orderData(dat, y~day/run), order.data=FALSE)
##D ranef(fit2)
## End(Not run)



