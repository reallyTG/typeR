library(RSE)


### Name: boot.incidence.fun
### Title: Generate a bootstrap incidence-based sample
### Aliases: boot.incidence.fun

### ** Examples

## As an example, Canadian-mite data are used here.	
data(CanadaMite)
## two columns represent two samples of incidence counts
X.merge = CanadaMite
## the first column is treated as the sample
X.col1 = X.merge[,1]
Xi = X.col1
## Convert species incidence count data to frequency counts data
Q = X.to.f(Xi)
## the number of quadrats in the first sample
nT = 16
b = DetInc(Xi, nT)	
boot.incidence.fun(S.hat=sum(Q)+b[3], nT=nT, Q=Q, b=b[1:2])



