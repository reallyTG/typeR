library(equSA)


### Name: equSAR
### Title: An equvalent mearsure of partial correlation coeffients
### Aliases: equSAR
### Keywords: equSAR

### ** Examples

## Don't show: 
library(equSA)
data(SR0)
subset <- SR0[1:100,1:10]
equSAR(subset,GRID=3,iteration=20)
## End(Don't show)
## No test: 
library(equSA)
data(SR0)
subset <- SR0
equSAR(subset)
## End(No test)




