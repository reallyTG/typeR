library(rare)


### Name: rarefit
### Title: Fit the rare feature selection model
### Aliases: rarefit

### ** Examples

## Not run: 
##D # See vignette for more details.
##D set.seed(100)
##D ts <- sample(1:length(data.rating), 400) # Train set indices
##D # Fit the model on train set
##D ourfit <- rarefit(y = data.rating[ts], X = data.dtm[ts, ], hc = data.hc, lam.min.ratio = 1e-6,
##D                   nlam = 20, nalpha = 10, rho = 0.01, eps1 = 1e-5, eps2 = 1e-5, maxite = 1e4)
## End(Not run)




