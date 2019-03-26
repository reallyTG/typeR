library(qpcR)


### Name: parKOD
### Title: Parameters that can be changed to tweak the kinetic outlier
###   methods
### Aliases: parKOD
### Keywords: models nonlinear

### ** Examples

## Multivariate outliers,
## adjusting the 'cut' parameter.
ml1 <- modlist(reps, 1, 2:5, model = l5)
res1 <- KOD(ml1, method = "multi1", par = parKOD(cut = c(-5, 2)))



