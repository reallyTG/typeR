library(windex)


### Name: windex
### Title: Calculates Wheatsheaf index with 95% confidence intervals
### Aliases: windex

### ** Examples

data(sample.data)
data(sample.tree)
windex(sample.data,sample.tree,traits=c("ou1","ou2"),focal=sample.data[,2],
SE=FALSE)




