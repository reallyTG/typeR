library(phylolm)


### Name: rTrait
### Title: Continuous trait simulation
### Aliases: rTrait

### ** Examples

tre = rtree(50)
y = rTrait(n=1, phy=tre, model="OU",
           parameters=list(optimal.value=2,sigma2=1,alpha=0.1))



