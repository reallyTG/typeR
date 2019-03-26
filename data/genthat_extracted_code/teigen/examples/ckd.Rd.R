library(teigen)


### Name: ckd
### Title: Indian Chronic Kidney Disease Data
### Aliases: ckd
### Keywords: datasets

### ** Examples

data(ckd)
hclustres <- cutree(hclust(dist(ckd[,-1])),3)
table(ckd[,1], hclustres)



