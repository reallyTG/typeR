library(OptSig)


### Name: Opt.Sig.Chisq
### Title: Optimal Significance Level for a Chi-square test
### Aliases: Opt.Sig.Chisq
### Keywords: htest

### ** Examples

# Optimal level of Significance for the Breusch-Pagan test: Chi-square version
data(data1)                 # call the data: Table 2.1 of Gujarati (2015)

# Extract Y and X
y=data1$lnoutput; x=cbind(data1$lncapital,data1$lnlabor)

# Restriction matrices for the slope coefficents sum to 1
Rmat=matrix(c(0,1,1),nrow=1); rvec=matrix(1,nrow=1)

# Model Estimation
M=R.OLS(y,x,Rmat,rvec); print(M$coef)

# Breusch-Pagan test for heteroskedasticity
e = M$resid[,1]                  # residuals from unrestricted model estimation

# Restriction matrices for the slope coefficients being 0
Rmat=matrix(c(0,0,1,0,0,1),nrow=2); rvec=matrix(0,nrow=2)

# Model Estimation for the auxilliary regression
M1=R.OLS(e^2,x,Rmat,rvec); 

# Degrees of Freedom and estimate of non-centrality parameter 
df1=nrow(Rmat); NCP=M1$ncp

# LM stat and p-value
LM=nrow(data1)*M1$Rsq[1,1]
pval=pchisq(LM,df=df1,lower.tail = FALSE)

Opt.Sig.Chisq(df=df1,ncp=NCP,p=0.5,k=1, Figure=TRUE)



