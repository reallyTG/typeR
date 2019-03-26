library(noise)


### Name: computeNoiseForSubset
### Title: Select a random subset of data for noise estimation.
### Aliases: computeNoiseForSubset

### ** Examples

data(yang_nl10)

# quantile normalization on log2 transformed data
# install bioconductor package for quantile normalization
# source('http://bioconductor.org/biocLite.R')
# biocLite('preprocessCore')
library(preprocessCore)

# ignore a few values that are negative
yang_nl10.pos <- yang_nl10[-which (yang_nl10[,1]<0),]
yang_nl10.pos.log2.quant <- normalize.quantiles (as.matrix (log2 (yang_nl10.pos[,c(1,3)])))

# subset the data and compute noise estimates
yang.50 <- computeNoiseForSubset (yang_nl10.pos.log2.quant, sample.size=50, n.iter=1000)
summary (yang.50)



