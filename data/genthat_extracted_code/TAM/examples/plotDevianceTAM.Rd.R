library(TAM)


### Name: plotDevianceTAM
### Title: Deviance Plot for 'TAM' Objects
### Aliases: plotDevianceTAM
### Keywords: plot

### ** Examples

#############################################################################
# EXAMPLE 1: deviance plot dichotomous data
#############################################################################
data(data.sim.rasch)

# 2PL model
mod1 <- TAM::tam.mml.2pl(resp=data.sim.rasch )
# plot deviance change
plotDevianceTAM( mod1 )
# plot deviance
plotDevianceTAM( mod1, change=FALSE)



