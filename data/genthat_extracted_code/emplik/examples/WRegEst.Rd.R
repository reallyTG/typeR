library(emplik)


### Name: WRegEst
### Title: Compute the casewise weighted regression estimator for AFT model
### Aliases: WRegEst
### Keywords: nonparametric

### ** Examples

data(smallcell)
WRegEst(x=cbind(1,smallcell[,1],smallcell[,2]), 
        y=smallcell[,3], delta=smallcell[,4]) 
####################################################
#### you should get         x1         x2         x3
####                 -59.22126 -488.41306   16.03259
####################################################
WRegEst(x=cbind(1,smallcell[,1],smallcell[,2]), 
        y=log10(smallcell[,3]), delta=smallcell[,4], LS=FALSE) 
########################################################
#### you should get      
####     [1]     2.603342985  -0.263000044  0.003836832
########################################################



