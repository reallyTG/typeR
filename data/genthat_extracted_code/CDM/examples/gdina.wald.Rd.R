library(CDM)


### Name: gdina.wald
### Title: Wald Statistic for Item Fit of the DINA and ACDM Rule for GDINA
###   Model
### Aliases: gdina.wald summary.gdina.wald
### Keywords: Wald test GDINA model

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Wald test for DINA simulated data sim.dina
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D # Model 1: estimate GDINA model
##D mod1 <- CDM::gdina( sim.dina, q.matrix=sim.qmatrix,  rule="GDINA")
##D summary(mod1)
##D 
##D # perform Wald test
##D res1 <- CDM::gdina.wald( mod1 )
##D summary(res1)
##D # -> results show that all but one item fit according to the DINA rule
##D 
##D # select some output
##D summary(res1, vars=c("wgtdist", "p") )
## End(Not run)



