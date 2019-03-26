library(PIGShift)


### Name: norminvgamma.shift.like.norm
### Title: Calculate the likelihood of normalized comparative data as
###   Brownian motions with inverse gamma distributed rates
### Aliases: norminvgamma.shift.like.norm

### ** Examples

data(yeast)
sim.dat = norminvgamma.shift.sim.group(yeast.tree,2,2,rep(1,6),10)
norminvgamma.shift.like.norm(yeast.tree,sim.dat,2,2,rep(1,6))



