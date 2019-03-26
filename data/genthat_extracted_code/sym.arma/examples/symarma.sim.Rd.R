library(sym.arma)


### Name: symarma.sim
### Title: Simulate from an SYMARMA model
### Aliases: symarma.sim

### ** Examples

serie0 <- symarma.sim(model=list(ar=c(0.3,0.2),ma=c(0.34)),n=70,
 varphi=1)
serie1 <- symarma.sim(model=list(ar=c(0,0,0.65)),n=70,family="Student",
 index1 = 4,varphi=1)



