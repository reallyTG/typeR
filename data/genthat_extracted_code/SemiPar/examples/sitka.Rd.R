library(SemiPar)


### Name: sitka
### Title: Sitka spruce data
### Aliases: sitka
### Keywords: datasets

### ** Examples

library(SemiPar)
data(sitka)
attach(sitka)
library(lattice)
ozone.char <- rep("control",nrow(sitka))
ozone.char[ozone==1] <- "ozone"
xyplot(log.size~days|ozone.char,data=sitka,groups=id.num,type="b")



