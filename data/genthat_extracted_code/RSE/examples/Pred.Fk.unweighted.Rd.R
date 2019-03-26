library(RSE)


### Name: Pred.Fk.unweighted
### Title: Abundance-based data: Unweighted estimator
### Aliases: Pred.Fk.unweighted

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
## the estimated number of unseen species in the original sample
f0 = SpEst.Chao1.abun(f)-sum(f)	
Pred.Fk.unweighted(f=f, m=m, b=b, f0=f0)	



