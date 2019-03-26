library(noise)


### Name: yang_nl10
### Title: Expression of reporter genes in the NL010 E. coli cells from
###   Yang et al (2014).
### Aliases: yang_nl10
### Keywords: datasets

### ** Examples

data(yang_nl10)

# compute the noise estimates

# no normalization
# unscaled by mean
unlist (computeIntrinsicNoise (yang_nl10[,1], yang_nl10[,3]))
unlist (computeExtrinsicNoise (yang_nl10[,1], yang_nl10[,3]))

# scaled by mean
unlist (computeIntrinsicNoise (yang_nl10[,1], yang_nl10[,3])) / 
    mean (yang_nl10[,1]) / mean(yang_nl10[,3])
unlist (computeExtrinsicNoise (yang_nl10[,1], yang_nl10[,3])) / 
    mean (yang_nl10[,1]) / mean(yang_nl10[,3])

# quantile normalization on log2 transformed data
# install bioconductor package for quantile normalization
# source('http://bioconductor.org/biocLite.R')
# biocLite('preprocessCore')
library(preprocessCore)

# ignore a few values that are negative
yang_nl10.pos <- yang_nl10[-which (yang_nl10[,1]<0),]
yang_nl10.pos.log2.quant <- normalize.quantiles (as.matrix (log2 (yang_nl10.pos[,c(1,3)])))

# unscaled by mean
unlist (computeIntrinsicNoise (yang_nl10.pos.log2.quant[,1], yang_nl10.pos.log2.quant[,2]))
unlist (computeExtrinsicNoise (yang_nl10.pos.log2.quant[,1], yang_nl10.pos.log2.quant[,2]))

# scaled by mean
unlist (computeIntrinsicNoise (yang_nl10.pos.log2.quant[,1], yang_nl10.pos.log2.quant[,2])) / 
    mean (yang_nl10.pos.log2.quant[,1]) / mean(yang_nl10.pos.log2.quant[,2])
unlist (computeExtrinsicNoise (yang_nl10.pos.log2.quant[,1], yang_nl10.pos.log2.quant[,2])) / 
    mean (yang_nl10.pos.log2.quant[,1]) / mean(yang_nl10.pos.log2.quant[,2])




