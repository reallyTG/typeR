library(rare)


### Name: group.recover
### Title: Recover aggregated groups of leaf indices
### Aliases: group.recover

### ** Examples

## Not run: 
##D # See vignette for more details.
##D set.seed(100)
##D ts <- sample(1:length(data.rating), 400) # Train set indices
##D # Fit the model on train set
##D ourfit <- rarefit(y = data.rating[ts], X = data.dtm[ts, ], hc = data.hc, lam.min.ratio = 1e-6,
##D                   nlam = 20, nalpha = 10, rho = 0.01, eps1 = 1e-5, eps2 = 1e-5, maxite = 1e4)
##D # Cross validation
##D ourfit.cv <- rarefit.cv(ourfit, y = data.rating[ts], X = data.dtm[ts, ],
##D                         rho = 0.01, eps1 = 1e-5, eps2 = 1e-5, maxite = 1e4)
##D # Group recovered at optimal beta and gamma
##D ibest.lambda <- ourfit.cv$ibest[1]
##D ibest.alpha <- ourfit.cv$ibest[2]
##D gamma.opt <- ourfit$gamma[[ibest.alpha]][, ibest.lambda] # works if ibest.alpha > 1
##D groups.opt <- group.recover(gamma.opt, ourfit$A)
## End(Not run)




