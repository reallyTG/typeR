library(NScluster)


### Name: mple.cppm
### Title: MPLE of Neyman-Scott Cluster Point Process Models and Their
###   Extensions
### Aliases: mple.cppm coef.mple summary.mple
### Keywords: spatial

### ** Examples

## Not run: 
##D # The computation of MPLEs takes a long CPU time in the minimization procedure,
##D # especially for the Inverse-power type and the Type A models.
##D 
##D ### Thomas Model
##D  # simulation
##D  pars <- c(mu = 50.0, nu = 30.0, sigma = 0.03)
##D  t.sim <- sim.cppm("Thomas", pars, seed = 117)
##D  ## estimation
##D  init.pars <- c(mu = 40.0, nu = 40.0, sigma = 0.05)
##D  t.mple <- mple.cppm("Thomas", t.sim$offspring$xy, init.pars)
##D  coef(t.mple)
##D 
##D ### Inverse-Power Type Model
##D  # simulation
##D  pars <- c(mu = 50.0, nu = 30.0, p = 1.5, c = 0.005)
##D  ip.sim <- sim.cppm("IP", pars, seed = 353)
##D  ## estimation
##D  init.pars <- c(mu = 55.0, nu = 35.0, p = 1.0, c = 0.01)
##D  ip.mple <- mple.cppm("IP", ip.sim$offspring$xy, init.pars, skip = 100)
##D  coef(ip.mple)
##D 
##D ### Type A Model
##D  # simulation
##D  pars <- c(mu = 50.0, nu = 30.0, a = 0.3, sigma1 = 0.005, sigma2 = 0.1)
##D  a.sim <- sim.cppm("TypeA", pars, seed = 575)
##D  ## estimation
##D  init.pars <- c(mu = 60.0, nu = 40.0, a = 0.5, sigma1 = 0.01, sigma2 = 0.1)
##D  a.mple <- mple.cppm("TypeA", a.sim$offspring$xy, init.pars, skip = 100)
##D  coef(a.mple)
##D 
##D ### Type B Model
##D  # simulation
##D  pars <- c(mu1 = 10.0, mu2 = 40.0, nu = 30.0, sigma1 = 0.01, sigma2 = 0.03)
##D  b.sim <- sim.cppm("TypeB", pars, seed = 257)
##D  ## estimation
##D  init.pars <- c(mu1 = 20.0, mu2 = 30.0, nu = 30.0, sigma1 = 0.02, sigma2 = 0.02)
##D  b.mple <- mple.cppm("TypeB", b.sim$offspring$xy, init.pars)
##D  coef(b.mple)
##D 
##D ### Type C Model
##D  # simulation
##D  pars <- c(mu1 = 5.0, mu2 = 9.0, nu1 = 30.0, nu2 = 150.0,
##D            sigma1 = 0.01, sigma2 = 0.05)
##D  c.sim <- sim.cppm("TypeC", pars, seed = 555)
##D  ## estimation
##D  init.pars <- c(mu1 = 10.0, mu2 = 10.0, nu1 = 30.0, nu2 = 120.0,
##D                 sigma1 = 0.03, sigma2 = 0.03)
##D  c.mple <- mple.cppm("TypeC", c.sim$offspring$xy, init.pars)
##D  coef(c.mple)
## End(Not run)



