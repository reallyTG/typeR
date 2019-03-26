library(Surrogate)


### Name: MinSurrContCont
### Title: Examine the plausibility of finding a good surrogate endpoint in
###   the Continuous-continuous case
### Aliases: MinSurrContCont
### Keywords: Plausibility of a good surrogate

### ** Examples

# Assess the plausibility of finding a good surrogate when
# sigma_T0T0 = sigma_T1T1 = 8 and Delta = 1
## Not run: 
##D MinSurr <- MinSurrContCont(T0T0 = 8, T1T1 = 8, Delta = 1)
##D summary(MinSurr)
##D plot(MinSurr)
## End(Not run)



