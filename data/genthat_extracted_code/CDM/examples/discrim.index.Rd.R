library(CDM)


### Name: discrim.index
### Title: Discrimination Indices at Item-Attribute, Item and Test Level
### Aliases: discrim.index discrim.index.din discrim.index.gdina
###   discrim.index.mcdina summary.discrim.index

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: DINA and GDINA model
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D #-- fit GDINA and DINA model
##D mod1 <- CDM::gdina( sim.dina, q.matrix=sim.qmatrix )
##D mod2 <- CDM::din( sim.dina, q.matrix=sim.qmatrix )
##D 
##D #-- compute discrimination indices
##D dimod1 <- CDM::discrim.index(mod1)
##D dimod2 <- CDM::discrim.index(mod2)
##D summary(dimod1)
##D summary(dimod2)
## End(Not run)



