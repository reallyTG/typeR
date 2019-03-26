library(pcIRT)


### Name: pcIRT-package
### Title: IRT Models for Polytomous and Continuous Item Responses
### Aliases: pcIRT-package pcIRT
### Keywords: Continuous IRT Item Model Rasch Rating Response Scale Theory
###   model multidimensional package polytomous psychometrics

### ** Examples


#simulate data set according to the multidimensional polytomous Rasch model (MPRM)
simdat <- simMPRM(rbind(matrix(c(-1.5,0.5,0.5,1,0.8,-0.3, 0.2,-1.2), ncol=4),0), 500)

#estimate MPRM item parameters
res_mprm <- MPRM(simdat$datmat)

summary(res_mprm)





