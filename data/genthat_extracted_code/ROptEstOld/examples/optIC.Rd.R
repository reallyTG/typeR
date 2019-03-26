library(ROptEstOld)


### Name: optIC
### Title: Generic function for the computation of optimally robust ICs
### Aliases: optIC optIC-methods optIC,L2ParamFamily,asCov-method
###   optIC,InfRobModel,asRisk-method optIC,InfRobModel,asUnOvShoot-method
###   optIC,FixRobModel,fiUnOvShoot-method
### Keywords: robust

### ** Examples

B <- BinomFamily(size = 25, prob = 0.25) 

## classical optimal IC
IC0 <- optIC(model = B, risk = asCov())
plot(IC0) # plot IC
checkIC(IC0, B)



