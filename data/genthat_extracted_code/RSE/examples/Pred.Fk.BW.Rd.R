library(RSE)


### Name: Pred.Fk.BW
### Title: Abundance-based data: Bayesian-weight estimator
### Aliases: Pred.Fk.BW

### ** Examples

## As an example, Herpetological assemblage data are used here.		
data(HerpetologicalData)
## two columns represent two samples of species abundance data
X.merge = HerpetologicalData
## the first column is treated as the original sample
X.col1 = X.merge[,1]
## the second column is treated as the additional sample
X.col2 = X.merge[,2]
Xi = X.col1
## Convert species abundance data to species frequency counts data
f = X.to.f(Xi)
## the number of individuals of the additional sample 
m = sum(X.col2)
b = DetAbu(x=Xi, zero=FALSE)		
Pred.Fk.BW(f=f, m=m, b=b)	



