library(RSE)


### Name: SpEst.Chao1.abun
### Title: Species richness estimation
### Aliases: SpEst.Chao1.abun

### ** Examples

## As an example, Herpetological assemblage data are used here.		
data(HerpetologicalData)
## two columns represent two samples of species abundance data
X.merge = HerpetologicalData
## the first column is treated as the original sample
Xi = X.merge[,1]
## Convert species abundance data to species frequency counts data
f = X.to.f(Xi)
SpEst.Chao1.abun(f=f)



