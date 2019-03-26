library(timeSeq)


### Name: timeSeq.screeplot
### Title: Scree Plot of Kullback Leibler Distance Ratios
### Aliases: timeSeq.screeplot

### ** Examples


data(simulate.dt)
attach(simulate.dt)
model.fit <- timeSeq(data.count, group.label, gene.names, exon.level = FALSE)
timeSeq.screeplot(model.fit, "lines")




