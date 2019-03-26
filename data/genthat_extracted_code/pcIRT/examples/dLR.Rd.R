library(pcIRT)


### Name: dLRT
### Title: Dimensionality test for the multidimensional polytomous Rasch
###   model
### Aliases: dLRT summary.dLR print.dLR print.dLR summary.dLR
### Keywords: dimensionality model test

### ** Examples


#simulate data set
simdat <- simMPRM(rbind(matrix(c(-1.5,0.5,0.5,1,0.8,-0.3, 0.2,-1.2), 
   ncol=4),0), 500)

#estimate MPRM item parameters
res_mprm <- MPRM(simdat$datmat)

res_dlrt <- dLRT(res_mprm)
summary(res_dlrt)





