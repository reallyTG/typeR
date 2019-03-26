library(MOCCA)


### Name: mocca
### Title: Multi-objective optimization for collecting cluster alternatives
### Aliases: mocca

### ** Examples

data(toy5)
res <- mocca(toy5, R=10, K=2:5)
print(res$objectiveVals)
# plot kmeans result for MCA index against neuralgas result for MCA index
plot(res$objectiveVals[1,], res$objectiveVals[5,], pch=NA,
xlab=rownames(res$objectiveVals)[1], ylab=rownames(res$objectiveVals)[5])
text(res$objectiveVals[1,], res$objectiveVals[5,], labels=colnames(res$objectiveVals))



