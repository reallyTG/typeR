library(GenomeInfoDbData)


### Name: GenomeInfoDb-package
### Title: Species and taxonomy ID look up tables
### Aliases: GenomeInfoDb-package specData
### Keywords: datasets

### ** Examples

data(specData)
sapply(specData, class)   #      tax_id       genus     species
			  #   "integer"    "factor" "character"

subset(specData, c(genus=="Homo" &  species=="sapiens"))$tax_id # [1] 9606



