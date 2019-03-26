library(GeneCycle)


### Name: fisher.g.test
### Title: Fisher's Exact g Test for Multiple (Genetic) Time Series
### Aliases: fisher.g.test
### Keywords: htest

### ** Examples


# load GeneCycle library
library("GeneCycle")

# load data set
data(caulobacter)

# how many samples and and how many genes?
dim(caulobacter)

# p-values from Fisher's g test
pval.caulobacter <- fisher.g.test(caulobacter)
pval.caulobacter

# compute Fdr and fdr values
fdr.out <- fdrtool(pval.caulobacter, statistic="pvalue")

# how many significant?
sum(fdr.out$qval < 0.05) # tail area-based Fdr
sum(fdr.out$lfdr < 0.2)  # density-based local fdr




