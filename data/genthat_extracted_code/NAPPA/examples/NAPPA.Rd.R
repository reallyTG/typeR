library(NAPPA)


### Name: NAPPA
### Title: NAPPA: A novel statistical method for the processing and
###   normalisation of mRNA data output from the Nanostring nCounter
###   software
### Aliases: NAPPA
### Keywords: Nanostring Normalisation

### ** Examples

# Read in RCC file and perform NAPPA normalisation
data(NS.Lung)
output <- NAPPA(data=NS.Lung, tissueType='tumour', NReferenceSamples=50)



