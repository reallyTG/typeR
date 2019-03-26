library(BMAmevt)


### Name: posteriorMCMC
### Title: MC MC sampler for parametric spectral measures
### Aliases: posteriorMCMC
### Keywords: htest multivariate

### ** Examples

data(Leeds)
data(pb.Hpar)
data(pb.MCpar)
postsample1 <- posteriorMCMC(Nsim=1e+3,Nbin=500,
         dat= Leeds,
         prior = prior.pb,
         proposal = proposal.pb,
         likelihood = dpairbeta,
         Hpar=pb.Hpar,
         MCpar=pb.MCpar)

dim(postsample1[[1]])
postsample1[-1]

## Not run: 
##D ## a more realistic one:
##D 
##D postsample2 <- posteriorMCMC(Nsim=50e+3,Nbin=15e+3,
##D          dat= Leeds,
##D          prior = prior.pb,
##D          proposal = proposal.pb,
##D          likelihood = dpairbeta,
##D          Hpar=pb.Hpar,
##D          MCpar=pb.MCpar)
##D dim(postsample2[[1]])
##D postsample2[-1]
## End(Not run)



