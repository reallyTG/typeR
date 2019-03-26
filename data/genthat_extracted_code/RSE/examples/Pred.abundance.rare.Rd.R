library(RSE)


### Name: Pred.abundance.rare
### Title: Abundance-based data: predicting the number of new rare species
### Aliases: Pred.abundance.rare

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
Pred.abundance.rare(f=f, m=m)	



