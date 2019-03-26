library(nlshrink)


### Name: ESD
### Title: Compute the empirical spectral distribution (ESD) for a set of
###   population eigenvalues
### Aliases: ESD

### ** Examples

tau_ESD <- ESD(tau = rep(1,200), n = 300)
plot(names(tau_ESD), tau_ESD, ylab="F(x)", xlab="x")



