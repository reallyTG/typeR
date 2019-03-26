library(PP)


### Name: PP
### Title: Estimation of Person Parameters and calculation of Person Fit
###   for the 1,2,3,4-PL model and the GPCM.
### Aliases: PP PP-package

### ** Examples

set.seed(1522)
# intercepts
diffpar <- seq(-3,3,length=12)
# slope parameters
sl     <- round(runif(12,0.5,1.5),2)
la     <- round(runif(12,0,0.25),2)
ua     <- round(runif(12,0.8,1),2)

# response matrix
awm <- matrix(sample(0:1,10*12,replace=TRUE),ncol=12)
# MLE estimation
res3plmle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,lowerA = la,type = "mle")
# WLE estimation
res3plwle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,lowerA = la,type = "wle")
# MAP estimation
res3plmap <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,lowerA = la,type = "map")

# calculate person fit
res3plmlepfit <- Pfit(respm=awm,pp=res3plmle,fitindices=c("infit","outfit"))

# or estimate person parameter and calculate person fit in one step 
out <- PPass(respdf = data.frame(awm),thres = diffpar, items="all",
             mod=c("1PL"), fitindices= c("lz","lzstar","infit","outfit"))



