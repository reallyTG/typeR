library(stpm)


### Name: spm
### Title: A central function that estimates Stochastic Process Model
###   parameters a from given dataset.
### Aliases: spm

### ** Examples

## Not run: 
##D  
##D library(stpm)
##D data.continuous <- simdata_cont(N=1000)
##D data.discrete <- simdata_discr(N=1000)
##D data <- list(data.continuous, data.discrete)
##D p.discr.model <- spm(data)
##D p.discr.model
##D p.cont.model <- spm(data, model="continuous")
##D p.cont.model
##D p.td.model <- spm(data, 
##D model="time-dependent",f=list(at="aa*t+bb", f1t="f1", Qt="Q", ft="f", bt="b", mu0t="mu0"), 
##D start=list(a=-0.001, bb=0.05, f1=80, Q=2e-8, f=80, b=5, mu0=1e-3))
##D p.td.model
## End(Not run)



