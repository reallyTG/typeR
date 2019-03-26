library(RSE)


### Name: DetAbu
### Title: Abundance-based data: the estimation of parameters for obtaining
###   the estimation of relative abundances of observed species
### Aliases: DetAbu

### ** Examples

## As an example, Herpetological assemblage data are used here.		
data(HerpetologicalData)
## two columns represent two samples of species abundance data
X.merge = HerpetologicalData
## the first column is treated as the original sample
Xi = X.merge[,1]
DetAbu(x=Xi)	



