library(EpiModel)


### Name: icm
### Title: Stochastic Individual Contact Models
### Aliases: icm
### Keywords: model

### ** Examples

## Not run: 
##D ## Example 1: SI Model
##D param <- param.icm(inf.prob = 0.2, act.rate = 0.25)
##D init <- init.icm(s.num = 500, i.num = 1)
##D control <- control.icm(type = "SI", nsteps = 500, nsims = 10)
##D mod1 <- icm(param, init, control)
##D mod1
##D plot(mod1)
##D 
##D ## Example 2: SIR Model
##D param <- param.icm(inf.prob = 0.2, act.rate = 0.25, rec.rate = 1/50)
##D init <- init.icm(s.num = 500, i.num = 1, r.num = 0)
##D control <- control.icm(type = "SIR", nsteps = 500, nsims = 10)
##D mod2 <- icm(param, init, control)
##D mod2
##D plot(mod2)
##D 
##D ## Example 3: SIS Model
##D param <- param.icm(inf.prob = 0.2, act.rate = 0.25, rec.rate = 1/50)
##D init <- init.icm(s.num = 500, i.num = 1)
##D control <- control.icm(type = "SIS", nsteps = 500, nsims = 10)
##D mod3 <- icm(param, init, control)
##D mod3
##D plot(mod3)
##D 
##D ## Example 4: SI Model with Vital Dynamics (Two-Group)
##D param <- param.icm(inf.prob = 0.4,  inf.prob.g2 = 0.1,
##D                    act.rate = 0.25, balance = "g1",
##D                    a.rate = 1/100, a.rate.g2 = NA,
##D                    ds.rate = 1/100, ds.rate.g2 = 1/100,
##D                    di.rate = 1/50, di.rate.g2 = 1/50)
##D init <- init.icm(s.num = 500, i.num = 1,
##D                  s.num.g2 = 500, i.num.g2 = 0)
##D control <- control.icm(type = "SI", nsteps = 500, nsims = 10)
##D mod4 <- icm(param, init, control)
##D mod4
##D plot(mod4)
## End(Not run)




