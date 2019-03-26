library(OptSig)


### Name: Opt.SigWeight
### Title: Weighted Optimal Significance Level for the F-test based on the
###   assumption of normality in the error term
### Aliases: Opt.SigWeight
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

Opt.Sig(df1,df2,ncp=NCP,p=0.5,k=1, Figure=TRUE)



