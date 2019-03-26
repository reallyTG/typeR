library(nlsem)


### Name: simulate
### Title: Simulate data from a structural equation model
### Aliases: simulate.singleClass simulate.semm simulate.nsemm

### ** Examples

# specify model
model <- specify_sem(num.x = 6, num.y = 3, num.xi = 2, num.eta = 1,
  xi = "x1-x3,x4-x6", eta = "y1-y3", interaction = "eta1~xi1:xi2")

# original parameters
pars.orig <- c(.6, .5, .4, .5, .4, .6, .5, .2, .6, .7, .3, .2, .5,
               .7, .3, .4, .6, .2, .3, .4, .6, .2, .2, .2, .2, .3,
               .3, 1, 0, 0, .8)

# simulate data from model
dat <- simulate(model, parameters = pars.orig)



