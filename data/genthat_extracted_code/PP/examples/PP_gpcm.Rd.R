library(PP)


### Name: PP_gpcm
### Title: Estimate Person Parameters for the GPCM
### Aliases: PP_gpcm
### Keywords: GPCM Parameters, Person

### ** Examples

################# GPCM ###########################################################################

# some threshold parameters
THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
# slopes
sl     <- c(0.5,1,1.5,1.1,1,0.98)
awmatrix <- matrix(c(1,0,2,0,1,1,1,0,0,1
                     ,2,0,0,0,0,0,0,0,0,1,1,2,2,1,1,1,1,0,0,1),byrow=TRUE,nrow=5)

## GPCM model ##### 

# MLE
resgpcmlmle <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = sl,type = "mle")
# WLE
resgpcmwle <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = sl,type = "wle")
# MAP estimation
resgpcmmap <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = sl,type = "map")
# EAP estimation
resgpcmeap <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = sl,type = "eap")
# robust estimation
resgpcmrob <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = sl,type = "robust")

## PCM model ##### 

# MLE
respcmlmle <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = rep(1,ncol(THRES)),type = "mle")
# WLE
respcmwle <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = rep(1,ncol(THRES)),type = "wle")
# MAP estimation
respcmmap <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = rep(1,ncol(THRES)),
                     type = "map")
# EAP estimation
respcmeap <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = rep(1,ncol(THRES)),
                     type = "eap")

#### with different number of categories ##

THRES  <- matrix(c(-2,-1.23,1.11,3.48,1,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
THRES1 <- rbind(THRES,c(NA,NA,NA,NA,1.7,1))

awmatrix1 <- matrix(c(1,0,2,0,1,3,1,0,0,1,3,1,0,0
                      ,0,0,0,0,0,1,1,2,2,1,1,1,1,0,0,1), byrow=TRUE, nrow=5)

# MLE estimation
respcmlmle1 <- PP_gpcm(respm = awmatrix1,thres = THRES1, slopes = sl,type = "mle")
# WLE estimation
respcmwle1 <- PP_gpcm(respm = awmatrix1,thres = THRES1, slopes = sl,type = "wle")
# MAP estimation
respcmmap1 <- PP_gpcm(respm = awmatrix1,thres = THRES1, slopes = sl,type = "map")
# EAP estimation
respcmeap1 <- PP_gpcm(respm = awmatrix1, thres = THRES1, slopes = sl,type = "eap")



