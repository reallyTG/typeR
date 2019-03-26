library(MVisAGe)


### Name: smooth.region.plot
### Title: A Function for Plotting Smoothed Pearson Correlation
###   Coefficients Genomewide
### Aliases: smooth.region.plot

### ** Examples

exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 prepped.data = data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)

 pd.exp = prepped.data[["exp"]]

 pd.cn = prepped.data[["cn"]]

 pd.ga = prepped.data[["gene.annot"]]

 pd.sa = prepped.data[["sample.annot"]]

 output.list = corr.list.compute(pd.exp, pd.cn, pd.ga, pd.sa)

 smooth.region.plot(plot.list = output.list, plot.chr = 11, plot.start = 0e6, plot.stop = 135e6)




