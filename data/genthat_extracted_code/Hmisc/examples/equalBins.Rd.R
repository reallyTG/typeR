library(Hmisc)


### Name: equalBins
### Title: Multicolumn Formating
### Aliases: equalBins
### Keywords: print

### ** Examples

mcols <- c("Group 1", "Group 2")
mwidth <- nchar(mcols, type="width")
spancols <- c(3,3)
ccols <- c("a", "deer", "ad", "cat", "help", "bob")
cwidth <- nchar(ccols, type="width")

subwidths <- partition.vector(cwidth, spancols)

equalBins(mwidth, subwidths)



