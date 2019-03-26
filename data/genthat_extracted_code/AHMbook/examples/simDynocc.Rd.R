library(AHMbook)


### Name: simDynocc
### Title: Simulate data under a non-spatial dynamic occupancy model
### Aliases: simDynocc

### ** Examples

# Generate data with the default arguments and look at the structure:
tmp <- simDynocc()
str(tmp)

# no annual variation in the parameters
str(data <- simDynocc(nsite = 250, nrep = 3, nyear = 10, mean.psi1 = 0.6,
    range.phi = c(0.7, 0.7), range.gamma = c(0.3, 0.3), range.p = c(0.5, 0.5)))
# a fully time-dependent model (with p constant within each primary period)
str(data <- simDynocc(mean.psi1 = 0.6, range.phi = c(0.5, 0.8),
   range.gamma = c(0.1, 0.5), range.p = c(0.1, 0.9)) )
# a time-constant model with four different covariates affecting the four parameters
str(data <- simDynocc(mean.psi1 = 0.6, beta.Xpsi1 = 1,
  range.phi = c(0.6, 0.6), beta.Xphi = 2, range.gamma = c(0.3, 0.3),
  beta.Xgamma = 2, range.p = c(0.2, 0.2), beta.Xp = -2) )
# seasonal variation in detection probability
str(data <- simDynocc(nrep = 12, mean.psi1 = 0.6,
  range.phi = c(0.6, 0.6), range.gamma = c(0.3, 0.3),
  range.p = c(0.5, 0.5), range.beta1.season = c(-0.3, 0.4),
  range.beta2.season = c(0, -0.7)) )
# now both yearly variation and effects of all covariates (including season)
str( data <- simDynocc(mean.psi1 = 0.6, beta.Xpsi1 = 1,
   range.phi = c(0.6, 1), beta.Xphi = 2, range.gamma = c(0, 0.2),
   beta.Xgamma = 2, range.p = c(0.1, 0.9), beta.Xp = -2,
   range.beta1.season = c(-0.4, 0.5), range.beta2.season = c(0, -0.8)) )

# To add detection heterogeneity at the site level, you can do this:
str(data <- simDynocc(range.sd.site = c(3, 3)) ) # No time trend
str(data <- simDynocc(range.sd.site = c(1, 3)) ) # With time trend

# To add detection heterogeneity at the level of the survey, you can do this:
str(data <- simDynocc(range.sd.survey = c(3, 3)) ) # No time trend
str(data <- simDynocc(range.sd.survey = c(1, 3)) ) # With time trend

# To add detection heterogeneity at the level of the individual visit, you can do this:
str(data <- simDynocc(range.sd.site.survey = c(3, 3)) ) # No trend
str(data <- simDynocc(range.sd.site.survey = c(1, 3)) ) # With trend

# To simulate data under a BACI design, where an impact happens in year 10
str(data <- simDynocc(nsite = 250, nrep = 3, nyear = 20, year.impact = 10,
   impact.phi = -80, impact.gamma = -50) )

# And data where there is no detection error (i.e., with p = 1):
str( data <- simDynocc(range.p = c(1, 1)) )




