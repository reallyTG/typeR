library(harmonicmeanp)


### Name: mamml.stat
### Title: Compute the model-averaged mean maximized likelihood
### Aliases: mamml.stat
### Keywords: ~MAMML

### ** Examples

# For detailed examples type vignette("harmonicmeanp")
nu = 3
R = exp(0.5*rchisq(1000,nu))
mamml.stat(R)
p.mamml(R,nu)



