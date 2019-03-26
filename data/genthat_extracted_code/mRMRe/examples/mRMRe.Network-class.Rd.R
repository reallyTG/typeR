library(mRMRe)


### Name: mRMRe.Network-class
### Title: Class '"mRMRe.Network"'
### Aliases: mRMRe.Network-class mRMR.network
### Keywords: classes

### ** Examples

showClass("mRMRe.Network")

set.thread.count(2)

## load data
data(cgps)

## build an mRMRe.Data object
ge <- mRMR.data(data = data.frame(cgps.ge[ , 1:100, drop=FALSE]))

## build a network object with the 10 first genes and their children,
## 8 distinct mRMR feature selections of 5 genes for each gene
exect <- system.time(netw <- new("mRMRe.Network", data = ge, target_indices = 1:10,
		levels = c(8, 1, 1, 1, 1), layers = 2))
print(exect)

## plot network using igraph
## Not run: visualize(netw)




