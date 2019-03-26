library(AHMbook)


### Name: sim3Occ
### Title: Simulate data for static 3-level occupancy models
### Aliases: sim3Occ

### ** Examples

# Generate data with the default arguments and look at the structure:
tmp <- sim3Occ()
str(tmp)

# 'Null' model (model 1)
str(data <- sim3Occ(nunit = 100, nsubunit = 5, nrep = 3, mean.psi = 0.8,
  beta.Xpsi = 0, sd.logit.psi = 0, mean.theta = 0.6, theta.time.range = c(0, 0),
  beta.Xtheta = 0, sd.logit.theta = 0, mean.p = 0.4, p.time.range = c(0,0),
  beta.Xp = 0, sd.logit.p = 0))

# No covariate effects, no random variability (model 2)
str(data <- sim3Occ(nunit = 100, nsubunit = 5, nrep = 3, mean.psi = 0.8,
  beta.Xpsi = 0, sd.logit.psi = 0, mean.theta = 0.6, theta.time.range = c(-1, 1),
  beta.Xtheta = 0, sd.logit.theta = 0, mean.p = 0.4, p.time.range = c(-2,2),
  beta.Xp = 0, sd.logit.p = 0))

# All covariate effects, but no random variability (model 3)
str(data <- sim3Occ(nunit = 100, nsubunit = 5, nrep = 3, mean.psi = 0.8,
  beta.Xpsi = 1, sd.logit.psi = 0, mean.theta = 0.6, theta.time.range = c(-1, 1), 
  beta.Xtheta = 1, sd.logit.theta = 0, mean.p = 0.4, p.time.range = c(-2,2),
  beta.Xp = -1, sd.logit.p = 0))

# Most complex model with all effects allowed for by sim function (model 4)
str(data <- sim3Occ(nunit = 100, nsubunit = 5, nrep = 3, mean.psi = 0.8,
  beta.Xpsi = 1, sd.logit.psi = 1, mean.theta = 0.6, theta.time.range = c(-1, 1), 
  beta.Xtheta = 1, sd.logit.theta = 1, mean.p = 0.4, p.time.range = c(-2,2),
  beta.Xp = -1, sd.logit.p = 1))



