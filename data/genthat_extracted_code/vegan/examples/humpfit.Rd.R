library(vegan)


### Name: humpfit
### Title: No-interaction Model for Hump-backed Species Richness vs.
###   Biomass
### Aliases: humpfit-deprecated summary.humpfit lines.humpfit plot.humpfit
###   points.humpfit predict.humpfit profile.humpfit
### Keywords: models regression nonlinear

### ** Examples

##
## Data approximated from Al-Mufti et al. (1977)
##
## No test: 
mass <- c(140,230,310,310,400,510,610,670,860,900,1050,1160,1900,2480)
spno <- c(1,  4,  3,  9, 18, 30, 20, 14,  3,  2,  3,  2,  5,  2)
sol <- humpfit(mass, spno)
summary(sol) # Almost infinite alpha...
plot(sol)
# confint is in MASS, and impicitly calls profile.humpfit.
# Parameter 3 (alpha) is too extreme for profile and confint, and we
# must use only "hump" and "scale".
library(MASS)
plot(profile(sol, parm=1:2))
confint(sol, parm=c(1,2))
## End(No test)



