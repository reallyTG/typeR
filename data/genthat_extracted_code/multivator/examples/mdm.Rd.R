library(multivator)


### Name: mdm
### Title: Multivariate design matrices
### Aliases: mdm mdm-class as.mdm is.mdm as.list as.matrix as.data.frame
###   types types<- names<- xold xold,mdm-method xold<- xold<-,mdm-method
###   as.list,mdm-method types,mdm-method types<-,mdm-method [,mdm-method
###   [<-,mdm-method levels,mdm-method levels<-,mdm-method
###   levels,experiment-method names,mdm-method names<-,mdm-method
###   rbind,mdm-method rownames,mdm-method rownames<-,mdm-method
###   as.matrix,mdm-method nrow,mdm-method ncol,mdm-method dim,mdm-method
###   as.mdm,mhp-method as.data.frame,mhp-method
###   as.data.frame,mdm,missing,missing-method rbind,mdm-method rbind

### ** Examples


mm <- toy_mm_maker(7,8,9)
is.mdm(mm)
xold(mm) <- matrix(rnorm(108),27,4)
mm[1,1] <- 0.3

data(mtoys)
obs_maker(mm,toy_mhp,toy_LoF,toy_beta)




