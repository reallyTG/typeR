library(VAR.etp)


### Name: PR.Fore
### Title: Improved Augmented Regression Method for Predictive Regression
### Aliases: PR.Fore
### Keywords: ys

### ** Examples

data(data1)
# Replicating Table 5 (excess return)
y=data1$ret.nyse.vw*100 -data1$tbill*100
x=cbind(log(data1$dy.nyse), data1$tbill*100); k=ncol(x) 
p=4
Rmat1=Rmatrix(p,k,type=1,index=1); Rmat=Rmat1$Rmat; rvec=Rmat1$rvec
M=PR.IARM(x,y,p,Rmat,rvec)
PRF=PR.Fore(x,y,M)



