library(BayesBD)


### Name: par2obs
### Title: Simulate binary intensity images
### Aliases: par2obs

### ** Examples

set.seed(2015)
# use ellipse boundary
gamma.fun = ellipse(a = 0.35, b = 0.25)
obs = par2obs(m = 100, pi.in = 0.5, pi.out = 0.2, design = 'J', center = c(0.5,0.5), gamma.fun)
plotBD(obs)



