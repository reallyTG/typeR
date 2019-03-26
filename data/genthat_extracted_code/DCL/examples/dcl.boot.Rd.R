library(DCL)


### Name: dcl.boot
### Title: Bootstrap distribution: the full cashflow
### Aliases: dcl.boot
### Keywords: htest

### ** Examples

# Results described in the data application by Martinez-Miranda, Nielsen and Verrall (2012)
data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters
est<-dcl.estimation(XtriangleDCL,NtriangleDCL)

# Full cashflow considering the tail (only the variance process)
# Below only B=200 simulations to be faster in the example
boot1<-dcl.boot(dcl.par=est,Ntriangle=NtriangleDCL,boot.type=1,B=200)
Plot.cashflow(boot1)

# Full cashflow with tail and taking into account the parameters uncertainty
# and B=999 simulations. Do not run it unless you can wait about one minute
# boot2<-dcl.boot(dcl.par=est,Ntriangle=NtriangleDCL,boot.type=2)
# Plot.cashflow(boot2)



