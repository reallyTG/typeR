library(nFactors)


### Name: plotuScree
### Title: Plot of the Usual Cattell's Scree Test
### Aliases: plotuScree
### Keywords: Graphics

### ** Examples

## SCREE PLOT
 data(dFactors)
 attach(dFactors)
 eig = Cliff1$eigenvalues
 plotuScree(x=eig)
 


