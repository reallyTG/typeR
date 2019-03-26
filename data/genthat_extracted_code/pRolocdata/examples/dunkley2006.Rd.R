library(pRolocdata)


### Name: dunkley2006
### Title: LOPIT data from Dunkley et al. (2006)
### Aliases: dunkley2006 dunkley2006goCC
### Keywords: datasets

### ** Examples

data(dunkley2006)
dunkley2006 
phenoData(dunkley2006)
## Input training data (organelle markers)
table(fData(dunkley2006)$markers)
## PLSDA assignment results
table(fData(dunkley2006)$assigned)
## PhenoDisco results
table(fData(dunkley2006)$pd.2013)



