library(ARTP)


### Name: snp.list
### Title: List to describe the genotype data
### Aliases: snp.list
### Keywords: misc

### ** Examples

# Suppose the genotype data is a tab-delimited, type 2 file: c:/temp/data/geno1.txt.
#  Also assume the data has the trend coding 0, 1, 2 with NA as missing values.
# The below list is for processing the file.
snp.list <- list(file="C:/temp/data/geno1.txt", delimiter="\t", file.type=2, 
                 heter.codes=1, in.miss=NA)



