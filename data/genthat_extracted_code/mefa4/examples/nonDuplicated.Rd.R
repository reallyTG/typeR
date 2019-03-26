library(mefa4)


### Name: nonDuplicated
### Title: Non Duplicated Rows in Data Frame
### Aliases: nonDuplicated
### Keywords: manip

### ** Examples

data(abmibirds)
x <- nonDuplicated(abmibirds, abmibirds$ABMI.Site, TRUE)
## or equivalently
#x <- nonDuplicated(abmibirds, ABMI.Site, TRUE)
dim(abmibirds)
dim(x)
length(unique(abmibirds$ABMI.Site))



