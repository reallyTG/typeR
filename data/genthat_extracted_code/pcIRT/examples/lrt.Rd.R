library(pcIRT)


### Name: LRT.DRM
### Title: Computes Andersen's Likelihood Ratio Test for the
###   multidimensional polytomous Rasch model
### Aliases: LRT.DRM LRT.MPRM LRT summary.aLR print.aLR LRT.MPRM LRT.DRM
###   print.aLR summary.aLR
### Keywords: Likelihood Ratio model test

### ** Examples


#simulate data set
simdat <- simMPRM(rbind(matrix(c(-1.5,0.5,0.5,1,0.8,-0.3, 0.2,-1.2), 
                  ncol=4),0), 500)

#estimate MPRM item parameters
res_mprm <- MPRM(simdat$datmat)

#compute Andersen's Likelihood Ratio test
res_lrt <- LRT(res_mprm)
summary(res_lrt)
  



