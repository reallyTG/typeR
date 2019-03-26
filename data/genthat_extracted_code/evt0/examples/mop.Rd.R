library(evt0)


### Name: mop
### Title: Mean of order p statistic for the extreme value index
### Aliases: mop mop.MOP mop.RBMOP mop.beta mop.rho
### Keywords: MOP EVI reduced-bias Hill

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1/0.5)

# estimate EVI 
mop(x,c(1,500,5000,49999), c(-1,0,1),"RBMOP")



