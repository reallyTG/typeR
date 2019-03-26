library(rankFD)


### Name: rankFD
### Title: Rank-based tests for general factorial designs
### Aliases: rankFD

### ** Examples

data(Coal)
model <- rankFD(Acidity ~ NaOH * Type, data = Coal, CI.method = "Normal",
effect = "unweighted", hypothesis = "H0F")

data(Muco)
model.oneway <- rankFD(HalfTime ~ Disease, data = Muco, CI.method = "Logit",
effect = "weighted", hypothesis = "H0p")
plot(model.oneway)





