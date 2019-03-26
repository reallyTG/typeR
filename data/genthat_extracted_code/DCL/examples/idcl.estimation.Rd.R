library(DCL)


### Name: idcl.estimation
### Title: Parameter estimation - DCL model reproducing the incurred
###   reserve.
### Aliases: idcl.estimation
### Keywords: models

### ** Examples

data(NtriangleBDCL)
data(XtriangleBDCL)
data(ItriangleBDCL)

my.idcl.par<-idcl.estimation(XtriangleBDCL,NtriangleBDCL,ItriangleBDCL)
# Parameters 
Plot.dcl.par(my.idcl.par,type.inflat='IDCL')
# IDCL Predictions by diagonals (future calendar years)
preds.idcl.diag<-dcl.predict(my.idcl.par,NtriangleBDCL,num.dec=0)

# Comparing with the BDCL method  
my.bdcl.par<-bdcl.estimation(XtriangleBDCL,NtriangleBDCL,ItriangleBDCL)
# Parameters shown in Table 1
Plot.dcl.par(my.bdcl.par,type.inflat='BDCL')
# BDCL Predictions by diagonals (future calendar years)
preds.bdcl.diag<-dcl.predict(my.bdcl.par,NtriangleBDCL,num.dec=0)




