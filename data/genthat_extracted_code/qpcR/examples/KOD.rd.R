library(qpcR)


### Name: KOD
### Title: (K)inetic (O)utlier (D)etection using several methods
### Aliases: KOD
### Keywords: models nonlinear

### ** Examples

## kinetic outliers:
## on a 'modlist', using efficiency from sigmoidal fit
## and alpha = 0.01. 
## F7.3 detected as outlier (shallower => low efficiency)
ml1 <- modlist(reps, 1, c(2:5, 28), model = l5)
res1 <- KOD(ml1, method = "uni1", par = parKOD(eff = "sliwin", alpha = 0.01))
plot(res1)

## Sigmoidal outliers:
## remove runs without sigmoidal structure.
ml2 <- modlist(testdat, model = l5)
res2 <- KOD(ml2, method = "uni2", remove = TRUE)
plot(res2, which = "single")

## Not run: 
##D ## Multivariate outliers:
##D ## a few runs are identified.
##D ml3 <- modlist(reps, model = l5)
##D res3 <- KOD(ml3, method = "multi1")
##D 
##D ## On a 'replist', several outliers identified.
##D rl3 <- replist(ml3, group = gl(7, 4))
##D res4 <- KOD(rl3, method = "uni1")
## End(Not run)



