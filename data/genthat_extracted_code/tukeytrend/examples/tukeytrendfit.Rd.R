library(tukeytrend)


### Name: tukeytrendfit
### Title: Fit multiple marginal models by updating a given fitted model
###   object with re-scaled dose variable.
### Aliases: tukeytrendfit
### Keywords: htest

### ** Examples


data(litter, package="multcomp")

# variable of interest is 'dose', but
# we may want to include 'number' as a covariate

dl <- litter
dl$dosen <- as.numeric(as.character(dl$dose))

fit <- lm(weight ~ dosen + number, data=dl)

# as it is unclear on which scale of dosage, 
# dose-response-shape is met best, we may try different
# re-scalings of the dose variable, including Dunnett- type multiple contrast test

ttlitter <- tukeytrendfit(fit, dose="dosen", 
 scaling=c("ari", "ord", "log", "treat"), ctype="Dunnett")

summary(asglht(ttlitter))





