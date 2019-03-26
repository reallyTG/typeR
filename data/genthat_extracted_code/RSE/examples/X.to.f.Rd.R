library(RSE)


### Name: X.to.f
### Title: Data transformation: from species abundance data to species
###   frequency counts data
### Aliases: X.to.f

### ** Examples

## As an example, Herpetological assemblage data are used here.		
data(HerpetologicalData)
## two columns represent two samples of species abundance data
X.merge = HerpetologicalData
## the first column is treated as the original sample
X.col1 = X.merge[,1]
Xi = X.col1
## convert species abundance data to species frequency counts data
X.to.f(Xi)	



