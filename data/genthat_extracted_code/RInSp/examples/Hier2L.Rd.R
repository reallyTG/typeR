library(RInSp)


### Name: Hier2L
### Title: Variance partition and WIC/TNW
### Aliases: Hier2L
### Keywords: univar models

### ** Examples

# Example of variance decomposition
data(Trout)
TroutRIS= import.RInSp(Trout, col.header=TRUE, row.names=1, info.cols=2, data.type="double")
decomp = Hier2L(TroutRIS, factor=1)
rm(list=ls(all=TRUE))



