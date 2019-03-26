library(MVisAGe)


### Name: corr.compute
### Title: A Function for Computing a Vector of Pearson Correlation
###   Coefficients
### Aliases: corr.compute

### ** Examples

corr.results = exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 prepped.data = data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)

 corr.compute(prepped.data[["exp"]], prepped.data[["cn"]], prepped.data[["gene.annot"]])




