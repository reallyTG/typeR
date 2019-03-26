library(MVisAGe)


### Name: corr.list.compute
### Title: A Function for Creating a List of Pearson Correlation
###   Coefficients
### Aliases: corr.list.compute

### ** Examples

exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 prepped.data = data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)

 pd.exp = prepped.data[["exp"]]

 pd.cn = prepped.data[["cn"]]

 pd.ga = prepped.data[["gene.annot"]]

 pd.sa = prepped.data[["sample.annot"]]

 corr.list.compute(pd.exp, pd.cn, pd.ga, pd.sa)




