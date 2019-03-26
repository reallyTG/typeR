library(BivRec)


### Name: biv.rec.plot
### Title: Bivariate Alternating Recurrent Series Plotting
### Aliases: biv.rec.plot

### ** Examples

library(BivRec)
set.seed(1234)
sim.data <- biv.rec.sim(nsize=150, beta1=c(0.5,0.5), beta2=c(0,-0.5), tau_c=63, set=1.1)
biv.rec.plot(formula = id + epi ~ xij + yij, data = sim.data)




