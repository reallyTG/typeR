library(VAR.etp)


### Name: PR.IARM
### Title: Improved Augmented Regression Method (IARM) for Predictive
###   Regression
### Aliases: PR.IARM
### Keywords: ts

### ** Examples

data(data1)
# Replicating Table 5 (excess return) of Kim (2014)
y=data1$ret.nyse.vw*100 -data1$tbill*100
x=cbind(log(data1$dy.nyse), data1$tbill*100); 

Rmat1=Rmatrix(p=1,k=2,type=1,index=0); Rmat=Rmat1$Rmat; rvec=Rmat1$rvec
M=PR.IARM(x,y,p=1,Rmat,rvec)


