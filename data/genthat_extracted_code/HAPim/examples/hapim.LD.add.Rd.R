library(HAPim)


### Name: hapim.LD.add
### Title: HAPimLD method
### Aliases: hapim.LD.add
### Keywords: models

### ** Examples

data(data.test)
map=data.test[[1]]
hap.trans.mere=data.test[[2]]
hap.trans.pere=data.test[[3]]
perf=data.test[[6]]
CD=data.test[[7]]


# In this example,marker positions are: 0, 0.010, 0.020, 0.030, 0.040, 0.050, 0.060, 
# 0.070, 0.080, 0.090. 
# We want to test the presence/absence of a QTL between 2 consecutive markers, so

position=c(0.005,0.015,0.025,0.035,0.045,0.055,0.065,0.075,0.085)

# we use a 2 markers-associated haplotype.
marq.hap.left=1

# We assume an evolution of 50 generations.
temps.depart=50
perfectLD=TRUE


hapim.LD.add=hapim.LD.add(hap.trans.pere,hap.trans.mere,perf,CD,map,position,

temps.depart,perfectLD,marq.hap.left)

hapim.LD.add




