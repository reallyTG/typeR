library(memisc)


### Name: as.array
### Title: Converting Data Frames into Arrays
### Aliases: as.array as.array,data.frame-method

### ** Examples

BerkeleyAdmissions <- to.data.frame(UCBAdmissions)
BerkeleyAdmissions
as.array(BerkeleyAdmissions,data.name="Admit")
try(as.array(BerkeleyAdmissions[-1,],data.name="Admit"))



