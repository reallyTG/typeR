library(seawaveQ)


### Name: fitMod
### Title: Internal function that fits the seawaveQ model.
### Aliases: fitMod
### Keywords: models regression survival ts

### ** Examples

data(swData)
myRes <- fitMod(cdatsub=examplecdatsub, cavdat=examplecavdat,
yrstart=1995, yrend=2003, tndbeg=1995, tndend=2003, tanm="myfit3",
pnames=c("04041"), qwcols=c("R", "P"))



