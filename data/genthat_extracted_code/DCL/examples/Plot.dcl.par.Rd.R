library(DCL)


### Name: Plot.dcl.par
### Title: Plotting the estimated parameters in the DCL model
### Aliases: Plot.dcl.par
### Keywords: Graphics

### ** Examples

data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters described in Martinez-Miranda, Nielsen and Verrall (2012)
my.dcl.par<-dcl.estimation(XtriangleDCL,NtriangleDCL)
Plot.dcl.par(my.dcl.par)



