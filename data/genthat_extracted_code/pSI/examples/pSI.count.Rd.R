library(pSI)


### Name: pSI.count
### Title: Convert pSI output to gene count list
### Aliases: pSI.count

### ** Examples

##load sample pSI output
data(sample.data)
##Count the number of genes specific to each cell type/sample type across all pSI thresholds
pSI.out.count <- pSI.count(pSIs=sample.data$pSI.output, write.csv=TRUE)



