library(RecordLinkage)


### Name: classifyUnsup
### Title: Unsupervised Classification
### Aliases: classifyUnsup
### Keywords: classif

### ** Examples

# Classification with bclust
data(RLdata500)
rpairs=compare.dedup(RLdata500, identity=identity.RLdata500,
                    blockfld=list(1,3,5,6,7))
result=classifyUnsup(rpairs,method="bclust")
summary(result)                    



