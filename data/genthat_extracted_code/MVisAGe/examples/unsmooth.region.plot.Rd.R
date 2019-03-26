library(MVisAGe)


### Name: unsmooth.region.plot
### Title: A Function for Plotting Pearson Correlation Coefficients in a
###   Given Genomic Region
### Aliases: unsmooth.region.plot

### ** Examples

exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 prepped.data = data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)

 pd.exp = prepped.data[["exp"]]

 pd.cn = prepped.data[["cn"]]

 pd.ga = prepped.data[["gene.annot"]]

 pd.sa = prepped.data[["sample.annot"]]

 output.list = corr.list.compute(pd.exp, pd.cn, pd.ga, pd.sa)

 unsmooth.region.plot(plot.list = output.list, plot.chr = 11, plot.start = 69e6, plot.stop = 70.5e6)




