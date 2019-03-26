library(DCL)


### Name: DCL-package
### Title: Claims Reserving under the Double Chain Ladder Model
### Aliases: DCL-package DCL
### Keywords: package package

### ** Examples

data(NtriangleDCL)
data(XtriangleDCL)

# Classical chain ladder parameters
my.clm.par<-clm(XtriangleDCL)
Plot.clm.par(my.clm.par)

# Estimation of the DCL parameters (break-down of the chain ladder parameters)
my.dcl.par<-dcl.estimation(XtriangleDCL,NtriangleDCL)
Plot.dcl.par(my.dcl.par)

# DCL Predictions by diagonals (future calendar years)
# Splitting the chain ladder reserve into RBNR and IBNR claims (ignoring the tail)
preds.dcl.diag<-dcl.predict(my.dcl.par,Model=0,Tail=FALSE,num.dec=0)

# Full cashflow considering the tail (only the variance process)
# Below only B=200 simulations for faster calculations in the example
boot1<-dcl.boot(dcl.par=my.dcl.par,Ntriangle=NtriangleDCL,boot.type=1,B=200)
Plot.cashflow(boot1)




