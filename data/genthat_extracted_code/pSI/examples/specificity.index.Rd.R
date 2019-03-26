library(pSI)


### Name: specificity.index
### Title: Specificity Index Statistic
### Aliases: specificity.index

### ** Examples

##load sample expression matrix
data(sample.data)
##calculate specificity index on expression matrix
##(Normally for RNAseq data, and e_min of 0.3, microarrays: e_min= 50)
pSI.output <- specificity.index(pSI.in=sample.data$pSI.input, e_min=20)



