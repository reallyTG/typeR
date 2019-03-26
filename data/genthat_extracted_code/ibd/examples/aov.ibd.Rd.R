library(ibd)


### Name: aov.ibd
### Title: Analysis of variance, least square means and contrast analysis
###   of data from a block design
### Aliases: aov.ibd
### Keywords: incomplete block design analysis of variance contrast
###   analysis balanced incomplete block design Estimated marginal means
###   EMMEANS Type III sum of squares

### ** Examples

data(ibddata)
aov.ibd(y~factor(trt)+factor(blk),data=ibddata)
contrast=matrix(c(1,-1,0,0,0,0,0,0,0,0,0,1,-1,0,0,0,0,0),nrow=2,byrow=TRUE)
aov.ibd(y~factor(trt)+factor(blk),specs="trt",data=ibddata,contrast=contrast)



