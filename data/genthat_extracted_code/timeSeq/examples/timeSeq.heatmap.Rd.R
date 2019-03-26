library(timeSeq)


### Name: timeSeq.heatmap
### Title: Heatmap of the Most Significant NDPE Genes
### Aliases: timeSeq.heatmap

### ** Examples


data(simulate.dt)
attach(simulate.dt)
model.fit <- timeSeq(data.count, group.label, gene.names, exon.level = FALSE)
timeSeq.heatmap(model.fit, n = 10)




