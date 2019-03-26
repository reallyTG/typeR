library(unmarked)


### Name: issj
### Title: Distance-sampling data for the Island Scrub Jay (_Aphelocoma
###   insularis_)
### Aliases: issj
### Keywords: datasets

### ** Examples

data(issj)
str(issj)
head(issj)

umf <- unmarkedFrameDS(y=as.matrix(issj[,1:3]), siteCovs=issj[,6:8],
    dist.breaks=c(0,100,200,300), unitsIn="m", survey="point")
summary(umf)




