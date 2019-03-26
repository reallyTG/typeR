library(PIGShift)


### Name: OU.invgamma.like.norm
### Title: Calculate the likelihood of normalized comparative data as OUs
###   with inverse gamma distributed rates
### Aliases: OU.invgamma.like.norm

### ** Examples

data(yeast)
sim.dat = OU.invgamma.sim.group(yeast.tree,2,2,2,10)
OU.invgamma.like.norm(yeast.tree,sim.dat,2,2,2)



