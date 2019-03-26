library(RSE)


### Name: DetInc
### Title: Incidence-based data: the estimation of parameters for obtaining
###   the estimation of detection probabilites of observed species
### Aliases: DetInc

### ** Examples

## As an example, Canadian-mite data are used here.	
data(CanadaMite)
## two columns represent two samples of incidence counts
X.merge = CanadaMite
## the first column is treated as the original sample
X.col1 = X.merge[,1]
Xi = X.col1
## the number of quadrats in the first sample
nT = 16
DetInc(y = Xi, nT = nT)	



