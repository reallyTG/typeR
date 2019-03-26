library(harmonicmeanp)


### Name: p.mamml
### Title: Compute a combined _p_-value via the model-averaged mean
###   maximized likelihood ratio
### Aliases: p.mamml
### Keywords: ~MAMML

### ** Examples

# For detailed examples type vignette("harmonicmeanp")
nu = 3
R = exp(0.5*rchisq(1000,nu))
mamml.stat(R)
p.mamml(R,nu)



