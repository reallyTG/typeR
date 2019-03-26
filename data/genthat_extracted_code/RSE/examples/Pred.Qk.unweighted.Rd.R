library(RSE)


### Name: Pred.Qk.unweighted
### Title: Incidence-based data: Unweighted Estimator
### Aliases: Pred.Qk.unweighted

### ** Examples

## As an example, Canadian-mite data are used here.	
data(CanadaMite)
## two columns represent two samples of incidence counts
X.merge = CanadaMite
## the first column is treated as the original sample
X.col1 = X.merge[,1]
Xi = X.col1
## Convert species incidence count data to frequency counts data
Q = X.to.f(Xi)
## the number of quadrats in the first sample
nT = 16
## the number of quadrats in the additional sample (i.e., the second column)
u = 16
b = DetInc(Xi, nT)			
Pred.Qk.unweighted(Q=Q, nT=nT, u=u, b=b[1:2], Q0=b[3])		



