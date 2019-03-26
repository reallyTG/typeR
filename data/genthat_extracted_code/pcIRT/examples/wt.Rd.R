library(pcIRT)


### Name: print.wt
### Title: Test for the scoring weights in the unidimensional polytomous
###   Rasch model
### Aliases: print.wt summary.wt weight_test summary.wt print.wt
### Keywords: scoring test weight

### ** Examples


#simulate data set
simdat <- simMPRM(rbind(matrix(c(-1.5,0.5,0.5,1,0.8,-0.3, 0.2,-1.2), 
                  ncol=4),0), 500)

#estimate MPRM item parameters
res_mprm <- MPRM(simdat$datmat)

#tests the scoring parameter 0.5 for the unidimensional polytomous model
res_weight <- weight_test(res_mprm,  score_param=c(0.5))
summary(res_weight)





