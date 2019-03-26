library(pcIRT)


### Name: MPRM
### Title: Estimation of Multidimensional Polytomous Rasch model (Rasch,
###   1961)
### Aliases: MPRM print.MPRM summary.MPRM
### Keywords: Rasch linear model multidimensional polytomous restriction

### ** Examples


#simulate data set according to the general MPRM
simdat <- simMPRM(rbind(matrix(c(-1.5,0.5,0.5,1,0.8,-0.3, 0.2,-1.2),
 ncol=4),0), 500)

#estimate the MPRM without any restrictions
res_mprm <- MPRM(simdat$datmat)

#estimate a MPRM with linear restrictions;
#for item 1 and 2 the second category is set linear dependent to the first
#category
ldes1 <- rep(0,length(res_mprm$itempar))
ldes1[c(2,5)] <- c(1,4)
lp1 <- rep(1,2)
#take the design matrix from the general MPRM and modify it according to the
#linear restriction
design1 <- res_mprm$design
design1[2,1] <- 1
design1[5,3] <- 1
design1[11,c(1,3)] <- -1
design1 <- design1[,-c(2,4)]

res_mprm2 <- MPRM(simdat$datmat, desmat=design1, ldes=ldes1, lp=lp1)

summary(res_mprm2)




