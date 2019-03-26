library(MVisAGe)


### Name: cn.region.heatmap
### Title: A Function for Creating a Heatmap of DNA Copy Number Data
### Aliases: cn.region.heatmap

### ** Examples

exp.mat = tcga.exp.convert(exp.mat)

 cn.mat = tcga.cn.convert(cn.mat)

 prepped.data = data.prep(exp.mat, cn.mat, gene.annot, sample.annot, log.exp = FALSE)

 pd.exp = prepped.data[["exp"]]

 pd.cn = prepped.data[["cn"]]

 pd.ga = prepped.data[["gene.annot"]]

 pd.sa = prepped.data[["sample.annot"]]

 output.list = corr.list.compute(pd.exp, pd.cn, pd.ga, pd.sa)

 cn.region.heatmap(cn.mat = pd.cn, gene.annot = pd.ga, plot.chr = 11,

plot.start = 0e6, plot.stop = 135e6, sample.annot = pd.sa, plot.list = output.list)




