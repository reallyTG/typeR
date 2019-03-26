library(MVisAGe)


### Name: smooth.genome.plot
### Title: A Function for Plotting Smoothed Pearson Correlation
###   Coefficients Across Multiple Chromosomes
### Aliases: smooth.genome.plot

### ** Examples

exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 prepped.data = data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)

 pd.exp = prepped.data[["exp"]]

 pd.cn = prepped.data[["cn"]]

 pd.ga = prepped.data[["gene.annot"]]

 pd.sa = prepped.data[["sample.annot"]]

 output.list = corr.list.compute(pd.exp, pd.cn, pd.ga, pd.sa)

 smooth.genome.plot(plot.list = output.list, lwd.vec = c(3, 3), lty.vec = c(1, 2))




