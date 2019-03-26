library(rare)


### Name: rarefit.predict
### Title: Make predictions from a rarefit object and a rarefit.cv object
### Aliases: rarefit.predict

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
##D # Prediction on test set
##D pred <- rarefit.predict(ourfit, ourfit.cv, data.dtm[-ts, ])
##D pred.error <- mean((pred - data.rating[-ts])^2)
## End(Not run)




