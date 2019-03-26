library(PCA4TS)


### Name: segmentVOL
### Title: Segment Multivariate Volatility Processes
### Aliases: segmentVOL

### ** Examples

## Example 7 of Chang et al.(2014)
## Segmenting the returns of the 6 stocks

require(tseries)
data(returns)
Y=returns
n=dim(Y)[1]; p=dim(Y)[2]
# Carry out the transformation procedure
Trans=segmentVOL(Y,5)
X_0=data.frame(Trans$X)
X_1=X_0
# The ACF plot of the residuals after prewhitening the transformed data by GARCH(1,1)
nanum=rep(0,p)
for(j in 1:p) {options( warn = -1 )
               t=garch(X_1[,j], order = c(1,1),trace=FALSE)
               X_1[,j]=t$residuals
               a=X_1[,j]
               nanum[j]=length(a[is.na(X_1[,j])]) }
X=X_1[(max(nanum)+1):n,]
colnames(X)=c("X1","X2","X3","X4","X5","X6")
t=acf(X,plot=FALSE)
plot(t, max.mfrow=6, xlab='', ylab='',  mar=c(1.8,1.3,1.6,0.5),
    oma=c(1,1.2,1.2,1), mgp=c(0.8,0.4,0),cex.main=1.0,ylim=c(0,1))
# Identify the permutation mechanism
permutation=permutationMax(X_0,Vol=TRUE)
permutation$Groups
options( warn = 0)



