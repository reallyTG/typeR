library(telefit)


### Name: summariseAlpha
### Title: Summarize alphas
### Aliases: summariseAlpha

### ** Examples

## Not run: 
##D data("coprecip")
##D data("coprecip.fit")
##D attach(coprecip)
##D 
##D # sample posterior predictive distributions AND estimate teleconnection effects
##D coprecip.precict = stPredict(stFit = coprecip.fit, stData = coprecip, 
##D                              stDataNew = coprecip, burn = 90, 
##D                              returnFullAlphas = TRUE)
##D 
##D alpha.90 = summariseAlpha(alpha = coprecip.precict$alpha, prob = .9, 
##D                           coords.s = coords.s, coords.r = coords.r)
## End(Not run)



