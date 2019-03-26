library(CDM)


### Name: IRT.frequencies
### Title: S3 Method for Computing Observed and Expected Frequencies of
###   Univariate and Bivariate Marginals
### Aliases: IRT.frequencies IRT_frequencies_default
###   IRT_frequencies_wrapper IRT.frequencies.din IRT.frequencies.gdina
###   IRT.frequencies.slca IRT.frequencies.mcdina IRT.frequencies.gdm

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Usage IRT.frequencies
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D # estimate GDINA model
##D mod1 <- CDM::gdina( data=sim.dina,  q.matrix=sim.qmatrix)
##D summary(mod1)
##D 
##D # direct usage of IRT.frequencies
##D fres1 <- CDM::IRT.frequencies(mod1)
##D 
##D # use of the default function with input data
##D data <- CDM::IRT.data(object)
##D post <- CDM::IRT.posterior(object)
##D probs <- CDM::IRT.irfprob(object)
##D fres2 <- CDM::IRT_frequencies_default(data=data, post=post, probs=probs)
## End(Not run)



