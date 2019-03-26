library(Renext)


### Name: Ren2gumbel
### Title: Translate a vector of coefficients from a Renewal-POT model with
###   exponential excesses to a vector of Gumbel parameters
### Aliases: Ren2gumbel

### ** Examples

## Fit a Renouv model with exponential excesses (default)
fit <- Renouv(Garonne)
## Convert to gumbel (usable for one-year block maxima)
parGumbel <- Ren2gumbel(fit)
## Retrieve the 'Renouv' model by giving the right threshold
parRen <- gumbel2Ren(parGumbel,
                     threshold = 2500,
                     vcovGumbel = attr(parGumbel, "vcov"),
                     plot = TRUE)
## Build a compatible model under the assumption of one event by
## year
parRen2 <- gumbel2Ren(parGumbel,
                      lambda = 1.00,
                      vcovGumbel = attr(parGumbel, "vcov"),
                      plot = TRUE)
parRenNames <- c("lambda", "rate")
## Build a 'Renouv' object without estimation
myVcov <- attr(parRen, "vcov")[parRenNames, parRenNames]
fitNew <- RenouvNoEst(threshold = attr(parRen, "threshold"),
                      estimate = parRen,
                      distname.y = "exp",
                      cov = myVcov)
## Compare return levels
cbind(roundPred(fit$pred)[ , -2], roundPred(fitNew$pred)[ , -2])
## idem for the putative 'Renouv' with rate 1
myVcov2 <- attr(parRen2, "vcov")[parRenNames, parRenNames]
fitNew2 <- RenouvNoEst(threshold = attr(parRen2, "threshold"),
                       estimate = parRen2,
                       distname.y = "exp",
                       cov = myVcov2)
cbind(roundPred(fit$pred)[ , -2], roundPred(fitNew2$pred)[ , -2])



