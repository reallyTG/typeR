library(OptSig)


### Name: Power.F
### Title: Function to calculate the power of an F-test
### Aliases: Power.F
### Keywords: htest

### ** Examples

data(data1)
# Define Y and X
y=data1$lnoutput; x=cbind(data1$lncapital,data1$lnlabor)
# Restriction matrices to test for constant returns to scale
Rmat=matrix(c(0,1,1),nrow=1); rvec=matrix(0.94,nrow=1)
# Model Estimation and F-test
M=R.OLS(y,x,Rmat,rvec) 
# Degrees of Freedom and estimate of non-centrality parameter 
K=ncol(x)+1; T=length(y)
df1=nrow(Rmat);df2=T-K; NCP=M$ncp

Power.F(df1,df2,ncp=NCP,alpha=0.20747,Figure=TRUE)



