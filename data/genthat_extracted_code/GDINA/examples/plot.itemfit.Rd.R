library(GDINA)


### Name: plot.itemfit
### Title: Item fit plots
### Aliases: plot.itemfit

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D 
##D fit <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D ift <- itemfit(fit)
##D # plot the adjusted p values for log odds or transformed correlation
##D plot(ift)
##D # plot unadjusted p values for log odds
##D plot(ift,adjusted = FALSE, type = "logOR")
## End(Not run)



