library(idr)


### Name: m.step.2normal
### Title: M-step for parameterized bivariate 2-component Gaussian mixture
###   models
### Aliases: m.step.2normal
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

 
z.1 <- c(rnorm(500, 0, 1), rnorm(500, 3, 1))
rho <- 0.8

##The component with higher values is correlated with correlation coefficient=0.8 
z.2 <- c(rnorm(500, 0, 1), rnorm(500, 3 + 0.8*(z.1[501:1000]-3), (1-rho^2)))
e.z <- c(rep(0, 500) + abs(rnorm(0, 0.05)), rep(1, 500)-abs(rnorm(0, 0.05)))

para <- m.step.2normal(z.1, z.2, e.z) 

para



