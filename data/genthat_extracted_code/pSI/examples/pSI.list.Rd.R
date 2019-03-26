library(pSI)


### Name: pSI.list
### Title: Convert pSI output to gene list
### Aliases: pSI.list

### ** Examples

##load sample pSI output
data(sample.data)
##List the genes specific to each cell type/sample type across all pSI thresholds
pSI.out.list <- pSI.list(pSIs=sample.data$pSI.output, write.csv=FALSE)



