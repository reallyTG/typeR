library(BMAmevt)


### Name: posteriorMCMC.nl
### Title: MC MC posterior samplers for the the PB and the NL model.
### Aliases: posteriorMCMC.nl posteriorMCMC.pb

### ** Examples

## Not run: 
##D data(Leeds)
##D data(pb.Hpar)
##D data(pb.MCpar)
##D data(nl.Hpar)
##D data(nl.MCpar)
##D pPB <- posteriorMCMC.pb(Nsim=5e+3, dat=Leeds, Hpar=pb.Hpar,
##D MCpar=pb.MCpar)
##D 
##D dim(pPB[1])
##D pPB[-(1:3)]
##D 
##D pNL <- posteriorMCMC.nl(Nsim=5e+3, dat=Leeds, Hpar=nl.Hpar,
##D MCpar=nl.MCpar)
##D 
##D dim(pNL[1])
##D pNL[-(1:3)]
## End(Not run)



