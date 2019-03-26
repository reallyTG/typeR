library(timeSeq)


### Name: timeSeq
### Title: Statistical Inference for Time Course RNA-Seq Data using a
###   Negative Binomial Mixed-Effects Model
### Aliases: timeSeq

### ** Examples

##Exon level data
data(pAbp)
attach(pAbp)
model.fit <- timeSeq(data.count, group.label, gene.names, exon.length)
detach(pAbp)

##Gene level data (three replicates)
data(simulate.dt)
attach(simulate.dt)
model.fit <- timeSeq(data.count, group.label, gene.names, exon.level=FALSE)
    



