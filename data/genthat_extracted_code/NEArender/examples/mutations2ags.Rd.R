library(NEArender)


### Name: mutations2ags
### Title: Create AGS from a mutation matrix
### Aliases: mutations2ags

### ** Examples

data("tcga.gbm",package="NEArender")
dim(tcga.gbm)
ags.list <- mutations2ags(tcga.gbm, col.mask="[-.]01$")
length(ags.list)
length(unique(unlist(ags.list)))



