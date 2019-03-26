library(cwm)


### Name: cwrEm
### Title: Function to estimate Cluster Weighted Regression (CWR) models
### Aliases: cwrEm
### Keywords: methods

### ** Examples

##using Geyser dataset from package MASS
library(MASS)
data(geyser)
x=geyser[,1]
y=geyser[,2]                            
cwrEmExample=cwrEm(x,y,nc=2)
print(cwrEmExample) 



