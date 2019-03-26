library(caRpools)


### Name: carpools.read.count.vs
### Title: QC: Scatterplots of Read-Counts
### Aliases: carpools.read.count.vs
### Keywords: ~compare ~readcount

### ** Examples


data(caRpools)

carpools.read.count.vs(dataset=list(TREAT1,CONTROL1),
dataset.names = c(d.TREAT1, d.CONTROL1),
  pairs=FALSE, namecolumn=1, fullmatchcolumn=2, title="", pch=16,
  normalize=TRUE, norm.function=median, labelgenes="random", labelcolor="blue",
  center=FALSE, aggregated=FALSE)
  
carpools.read.count.vs(dataset=list(TREAT1, TREAT2, CONTROL1, CONTROL2),
  dataset.names = c(d.TREAT1, d.TREAT2, d.CONTROL1, d.CONTROL2),
  pairs=TRUE, namecolumn=1, fullmatchcolumn=2, title="", pch=16,
  normalize=TRUE, norm.function=median,
  labelgenes="random", labelcolor="blue", center=FALSE, aggregated=FALSE)





