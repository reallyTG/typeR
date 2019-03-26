library(BayesBD)


### Name: parnormobs
### Title: Simulate Gaussian intensity images
### Aliases: parnormobs

### ** Examples

set.seed(2015)
# use ellipse boundary
gamma.fun = ellipse(a = 0.35, b = 0.25)
obs = parnormobs(m = 100, mu.in = 1, sd.in = 1, mu.out = 0, sd.out = 1, design = 'J',
 center = c(0.5,0.5), gamma.fun)
plotBD(obs)



