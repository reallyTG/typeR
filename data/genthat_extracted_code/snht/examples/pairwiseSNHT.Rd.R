library(snht)


### Name: pairwiseSNHT
### Title: Pairwise Standard Normal Homogeneity Test
### Aliases: pairwiseSNHT

### ** Examples

dist = matrix(1, nrow=2, ncol=2)
colnames(dist) = c(1, 2)
rownames(dist) = c(1, 2)
dist = dist - diag(2)
pairwiseSNHT(data=data.frame(data=c(rep(1, 10), rep(2, 10), rep(3, 10), rep(4, 10)),
                             location=rep(1:2, each=10)), dist=dist, k=1, period=2)



