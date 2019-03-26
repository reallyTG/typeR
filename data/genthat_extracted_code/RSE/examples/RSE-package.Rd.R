library(RSE)


### Name: RSE-package
### Title: Number of Newly Discovered Rare Species Estimation
### Aliases: RSE-package RSE

### ** Examples

###########################
#for abundance-based data type
data(HerpetologicalData)
## two columns represent two samples of species abundance data
X.merge = HerpetologicalData
## the first column is treated as the original sample
X.col1 = X.merge[,1]
## the second column is treated as the additional sample
X.col2 = X.merge[,2]
Xi = X.col1
## the number of individuals of the additional sample 
m = sum(X.col2)
print(Pred.abundance.rare(boot.rep = 100, f=NULL, xi=Xi, m = m, k.show = 3))

###########################
#for incidence-based data type
data(CanadaMite)
## two columns represent two samples of incidence counts
X.merge = CanadaMite
## the first column is treated as the original sample
X.col1 = X.merge[,1]
## the number of quadrats in the first sample
nT = 16
## the number of quadrats in the additional sample (i.e., the second column)
u = 16
print(Pred.incidence.rare(boot.rep = 100, Q=NULL, xi=X.col1, nT=nT, u=u, k.show = 3))



