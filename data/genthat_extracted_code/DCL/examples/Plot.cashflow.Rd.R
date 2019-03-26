library(DCL)


### Name: Plot.cashflow
### Title: Plotting the full cashflow (bootstrap distribution)
### Aliases: Plot.cashflow
### Keywords: Graphics

### ** Examples

# Results described in the data application by Martinez-Miranda, Nielsen and Verrall (2012)
data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters
est<-dcl.estimation(XtriangleDCL,NtriangleDCL)
# Full cashflow considering the tail (only variance process)
# Below only B=200 simulations for a fast example
boot1<-dcl.boot(dcl.par=est,Ntriangle=NtriangleDCL,boot.type=1,B=200)
Plot.cashflow(boot1)



