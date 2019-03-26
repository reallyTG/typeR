library(CDM)


### Name: coef
### Title: Extract Estimated Item Parameters and Skill Class Distribution
###   Parameters
### Aliases: coef.din coef.gdina coef.mcdina coef.gdm coef.slca
### Keywords: methods coef

### ** Examples

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

# DINA model
d1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix)
coef(d1)

## Not run: 
##D # GDINA model
##D d2 <- CDM::gdina( sim.dina, q.matrix=sim.qmatrix)
##D coef(d2)
##D 
##D # GDM model
##D theta.k <- seq(-4,4,len=11)
##D d3 <- CDM::gdm( sim.dina, irtmodel="2PL", theta.k=theta.k,
##D             Qmatrix=as.matrix(sim.qmatrix),  centered.latent=TRUE)
##D coef(d3)
## End(Not run)



