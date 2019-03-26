library(lmomco)


### Name: lmomkmu
### Title: L-moments of the Kappa-Mu Distribution
### Aliases: lmomkmu
### Keywords: L-moment (distribution) Distribution: Kappa-Mu

### ** Examples

kmu <- vec2par(c(1.19,2.3), type="kmu")
lmomkmu(kmu)
## Not run: 
##D par <- vec2par(c(1.67, .5), type="kmu")
##D lmomkmu(par)$lambdas
##D cdf2lmoms(par, nmom=4)$lambdas
##D 
##D system.time(lmomkmu(par))
##D system.time(cdf2lmoms(par, nmom=4))
## End(Not run)
# See the examples under lmomemu() so visualize L-moment
# relations on the L-skew and L-kurtosis diagram



