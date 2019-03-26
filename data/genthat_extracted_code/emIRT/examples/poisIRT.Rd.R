library(emIRT)


### Name: poisIRT
### Title: Poisson IRT estimation via EM
### Aliases: poisIRT
### Keywords: multivariate

### ** Examples


## Not run: 
##D ## Load German Manifesto data
##D data(manifesto)
##D 
##D ## Estimate variational Wordfish model
##D lout <- poisIRT(.rc = manifesto$data.manif,
##D 		    i = 0:(ncol(manifesto$data.manif)-1),
##D 		    NI=ncol(manifesto$data.manif),
##D                     .starts = manifesto$starts.manif,
##D                     .priors = manifesto$priors.manif,
##D                     .control = {list(
##D                         threads = 1,
##D                         verbose = TRUE,
##D                         thresh = 1e-6,
##D 						maxit=1000
##D                         )})
##D 
##D ## Positional Estimates for Parties
##D lout$means$x  
## End(Not run)




