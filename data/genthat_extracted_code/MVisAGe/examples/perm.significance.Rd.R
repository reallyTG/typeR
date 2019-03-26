library(MVisAGe)


### Name: perm.significance
### Title: A Function for Computing a Vector of Pearson Correlation
###   Coefficients
### Aliases: perm.significance

### ** Examples

exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 prepped.data = data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)

 perm.significance(prepped.data[["exp"]], prepped.data[["cn"]], prepped.data[["gene.annot"]])




