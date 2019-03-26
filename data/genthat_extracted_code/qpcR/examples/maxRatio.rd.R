library(qpcR)


### Name: maxRatio
### Title: The maxRatio method as in Shain et al. (2008)
### Aliases: maxRatio
### Keywords: models nonlinear

### ** Examples

## On single curve using baseline shifting.
m1 <- pcrfit(reps, 1, 2, l5)
maxRatio(m1, baseshift = 0.3)     

## On a 'modlist' using baseline shifting.
## Not run: 
##D ml1 <- modlist(reps, model = l5) 
##D maxRatio(ml1, baseshift = 0.5)
## End(Not run)



