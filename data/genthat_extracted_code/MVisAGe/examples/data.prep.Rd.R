library(MVisAGe)


### Name: data.prep
### Title: A Function for Preparing mRNAseq and Copy Number Data Matrices
### Aliases: data.prep

### ** Examples

exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)




