library(CDM)


### Name: entropy.lca
### Title: Test-specific and Item-specific Entropy for Latent Class Models
### Aliases: entropy.lca summary.entropy.lca
### Keywords: Entropy summary

### ** Examples

#############################################################################
# EXAMPLE 1: Entropy for DINA model
#############################################################################

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

# fit DINA Model
mod1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix, rule="DINA")
summary(mod1)
# compute entropy for test and items
emod1 <- CDM::entropy.lca( mod1 )
summary(emod1)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Entropy for polytomous GDINA model
##D #############################################################################
##D 
##D data(data.pgdina, package="CDM")
##D 
##D dat <- data.pgdina$dat
##D q.matrix <- data.pgdina$q.matrix
##D 
##D # pGDINA model with "DINA rule"
##D mod1 <- CDM::gdina( dat, q.matrix=q.matrix, rule="DINA")
##D summary(mod1)
##D 
##D # compute entropy
##D emod1 <- CDM::entropy.lca( mod1 )
##D summary(emod1)
##D 
##D #############################################################################
##D # EXAMPLE 3: Entropy for MCDINA model
##D #############################################################################
##D 
##D data(data.cdm02, package="CDM")
##D 
##D dat <- data.cdm02$data
##D q.matrix <- data.cdm02$q.matrix
##D 
##D # estimate model with polytomous atribute
##D mod1 <- CDM::mcdina( dat, q.matrix=q.matrix )
##D summary(mod1)
##D # computre entropy
##D emod1 <- CDM::entropy.lca( mod1 )
##D summary(emod1)
## End(Not run)



