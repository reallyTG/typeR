library(DCL)


### Name: bdcl.estimation
### Title: Parameter estimation - DCL model using the BDCL method
### Aliases: bdcl.estimation
### Keywords: models

### ** Examples

# Reproducing the data analysis in the paper by Martinez-Miranda, Nielsen and Verrall (2013) 
data(NtriangleBDCL)
data(XtriangleBDCL)
data(ItriangleBDCL)

my.bdcl.par<-bdcl.estimation(XtriangleBDCL,NtriangleBDCL,ItriangleBDCL)
# Parameters shown in Table 1
Plot.dcl.par(my.bdcl.par,type.inflat='BDCL')
# BDCL Predictions by diagonals (future calendar years)
preds.bdcl.diag<-dcl.predict(my.bdcl.par,NtriangleBDCL,num.dec=0)



