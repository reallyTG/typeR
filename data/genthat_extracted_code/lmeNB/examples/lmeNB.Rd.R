library(lmeNB)


### Name: lmeNB
### Title: Performs the maximum likelihood estimation for the negative
###   binomial mixed-effect model. This function is a wrapper for
###   'fitParaIND', 'fitParaAR1', 'fitSemiIND' and 'fitSemiAR1'.
### Aliases: lmeNB
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D ## ================================================================================ ##
##D ## generate a simulated dataset from the negative binomial mixed-effect 
##D ## independent model:
##D ## Y_ij | G_i = g_i ~ NB(r_ij,p_i) where r_ij = exp(X^T beta)/a , p_i =1/(a*g_i+1)
##D ## with G_i ~ log-normal(E(G_i)=1,var(G_i)=th)
##D set.seed(1)
##D sn <- 5 # the number of repeated measures of each patient
##D n <- 80 ## the number of patients
##D loga <- - 0.5 
##D a <- exp(loga) ## dispersion parameter 
##D logtheta <- 1.3
##D th <- exp(logtheta) ## the variance of the gamma distributed random effect g_i
##D 
##D 
##D ## No difference between the means of groups 
##D ## The model only has an intercept term beta0 <- 0.5
##D b0 <- 0.5
##D u1 <- rep(exp(b0),sn)  ## the mean vector for group 1 at time point 1,...,sn
##D u2 <- rep(exp(b0),sn) ## the mean vector for group 2 at time point 1,...,sn
##D 
##D ## DT.ind is generated from the IND model
##D DT.ind<- rNBME.R(gdist="N", n=n, a=a, th=th, u1=u1, u2=u2, sn=sn)
##D ## DT.ar is generated from AR(1) model with delta=0.4
##D DT.ar<- rNBME.R(gdist="N", n=n, a=a, th=th, u1=u1, u2=u2, sn=sn, d=0.4)
##D 
##D dt.ind<-data.frame(CEL=DT.ind$y,Vcode=DT.ind$vn-2,ID=DT.ind$id)
##D dt.ar<-data.frame(CEL=DT.ar$y,Vcode=DT.ar$vn-2,ID=DT.ar$id)
##D ## ================================================================================ ##
##D #### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ####
##D #### Fit various parametric independent models ####
##D #### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ####
##D tst1 <- lmeNB(CEL~1, data=dt.ind, ID=dt.ind$ID, IPRT=TRUE)            ## gamma Gi
##D tst2 <- lmeNB(CEL~1, data=dt.ar, ID=dt.ar$ID, IPRT=TRUE)              ## gamma Gi
##D tst3 <- lmeNB(CEL~1, data=dt.ind, ID=dt.ind$ID, IPRT=TRUE, RE="N")    ## log-normal Gi
##D tst4 <- lmeNB(CEL~1, data=dt.ar, ID=dt.ar$ID, IPRT=TRUE, RE="N")      ## log-normal Gi
##D tst5 <- lmeNB(CEL~Vcode, data=dt.ind, ID=dt.ind$ID, IPRT=TRUE, RE="N")## log-normal Gi
##D ## conditional probability index with the fitted results of tst5
##D Psum5 <- index.batch(olmeNB=tst5, labelnp=dt.ind$Vcode >= 1, data=dt.ind, ID=dt.ind$ID)
##D 
##D 
##D #### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ####
##D #### Fit the semi-parametric independent model ####
##D #### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ####
##D tst6 <- lmeNB(CEL~1, data=dt.ind, ID=dt.ind$ID, IPRT=TRUE, RE="NoN")
##D tst7 <- lmeNB(CEL~Vcode, data=dt.ind, ID=dt.ind$ID, IPRT=TRUE, RE="NoN",
##D               semi.boot=100,labelnp=dt.ind$Vcode >= 1) 
##D ## semi.boot = 100 option computes bootstrap SE and 95##D 
##D ## conditional probability index with fitting result of tst7
##D Psum7 <- index.batch(olmeNB=tst7,labelnp=dt.ind$Vcode >= 1, data=dt.ind, 
##D                      ID=dt.ind$ID, Vcode=Vcode)
##D 
##D #### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ####
##D #### Fit the parametric AR1 models ####
##D #### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ####
##D tst8 <- lmeNB(CEL~1, data=dt.ind, ID=dt.ind$ID, IPRT=TRUE,AR=TRUE,Vcode=dt.ind$Vcode)
##D tst9 <- lmeNB(CEL~1, data=dt.ar, ID=dt.ar$ID, IPRT=TRUE,AR=TRUE,Vcode=dt.ar$Vcode)
##D ## conditional probability index
##D Psum9 <- index.batch(olmeNB=tst9, labelnp=dt.ind$Vcode >= 1, data=dt.ind, 
##D                      ID=dt.ind$ID,Vcode=dt.ind$Vcode)
##D 
##D 
## End(Not run)




