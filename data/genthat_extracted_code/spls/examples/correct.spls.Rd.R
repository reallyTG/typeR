library(spls)


### Name: correct.spls
### Title: Correct the initial SPLS coefficient estimates based on
###   bootstrapped confidence intervals
### Aliases: correct.spls
### Keywords: regression multivariate

### ** Examples

data(mice)
# SPLS with eta=0.6 & 1 latent components
f <- spls( mice$x, mice$y, K=1, eta=0.6 )
# Calculate confidence intervals of coefficients
ci.f <- ci.spls(f)
# Corrected coefficient estimates
cf <- correct.spls( ci.f )
cf[20,1:5]



