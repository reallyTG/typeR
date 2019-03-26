library(lcmm)


### Name: Jointlcmm
### Title: Estimation of joint latent class models for longitudinal and
###   time-to-event data
### Aliases: Jointlcmm jlcmm jlcmm

### ** Examples




#### Example of a joint latent class model estimated for a varying number
# of latent classes: 
# The linear mixed model includes a subject- (ID) and class-specific 
# linear trend (intercept and Time in fixed, random and mixture components)
# and a common effect of X1 and its interaction with time over classes 
# (in fixed).
# The variance of the random intercept and slopes are assumed to be equal 
# over classes (nwg=F).
# The covariate X3 predicts the class membership (in classmb). 
# The baseline hazard function is modelled with cubic M-splines -3 
# nodes at the quantiles- (in hazard) and a proportional hazard over 
# classes is assumed (in hazardtype). Covariates X1 and X2 predict the 
# risk of event (in survival) with a common effect over classes for X1
# and a class-specific effect of X2.
# !CAUTION: for illustration, only default initial values where used but 
# other sets of initial values should be tried to ensure convergence
# towards the global maximum.


## Not run: 
##D #### estimation with 1 latent class (ng=1): independent models for the 
##D # longitudinal outcome and the time of event
##D m1 <- Jointlcmm(fixed= Ydep1~X1*Time,random=~Time,subject='ID'
##D ,survival = Surv(Tevent,Event)~ X1+X2 ,hazard="3-quant-splines"
##D ,hazardtype="PH",ng=1,data=data_lcmm)
##D summary(m1)
##D #Goodness-of-fit statistics for m1:
##D #    maximum log-likelihood: -3944.77 ; AIC: 7919.54  ;  BIC: 7975.09  
## End(Not run)

#### estimation with 2 latent classes (ng=2)
m2 <- Jointlcmm(fixed= Ydep1~Time*X1,mixture=~Time,random=~Time,
classmb=~X3,subject='ID',survival = Surv(Tevent,Event)~X1+mixture(X2),
hazard="3-quant-splines",hazardtype="PH",ng=2,data=data_lcmm,
B=c(0.64,-0.62,0,0,0.52,0.81,0.41,0.78,0.1,0.77,-0.05,10.43,11.3,-2.6,
-0.52,1.41,-0.05,0.91,0.05,0.21,1.5))
summary(m2)
#Goodness-of-fit statistics for m2:
#       maximum log-likelihood: -3921.27; AIC: 7884.54; BIC: 7962.32  

## Not run: 
##D #### estimation with 3 latent classes (ng=3)
##D m3 <- Jointlcmm(fixed= Ydep1~Time*X1,mixture=~Time,random=~Time,
##D classmb=~X3,subject='ID',survival = Surv(Tevent,Event)~ X1+mixture(X2),
##D hazard="3-quant-splines",hazardtype="PH",ng=3,data=data_lcmm,
##D B=c(0.77,0.4,-0.82,-0.27,0,0,0,0.3,0.62,2.62,5.31,-0.03,1.36,0.82,
##D -13.5,10.17,10.24,11.51,-2.62,-0.43,-0.61,1.47,-0.04,0.85,0.04,0.26,1.5))
##D summary(m3)
##D #Goodness-of-fit statistics for m3:
##D #       maximum log-likelihood: -3890.26 ; AIC: 7834.53;  BIC: 7934.53  
##D 
##D #### estimation with 4 latent classes (ng=4)
##D m4 <- Jointlcmm(fixed= Ydep1~Time*X1,mixture=~Time,random=~Time,
##D classmb=~X3,subject='ID',survival = Surv(Tevent,Event)~ X1+mixture(X2),
##D hazard="3-quant-splines",hazardtype="PH",ng=4,data=data_lcmm,
##D B=c(0.54,-0.42,0.36,-0.94,-0.64,-0.28,0,0,0,0.34,0.59,2.6,2.56,5.26,
##D -0.1,1.27,1.34,0.7,-5.72,10.54,9.02,10.2,11.58,-2.47,-2.78,-0.28,-0.57,
##D 1.48,-0.06,0.61,-0.07,0.31,1.5))
##D summary(m4)
##D #Goodness-of-fit statistics for m4:
##D #   maximum log-likelihood: -3886.93 ; AIC: 7839.86;  BIC: 7962.09  
##D 
##D 
##D ##### The model with 3 latent classes is retained according to the BIC  
##D ##### and the conditional independence assumption is not rejected at
##D ##### the 5% level. 
##D # posterior classification
##D plot(m3,which="postprob")
##D # Class-specific predicted baseline risk & survival functions in the 
##D # 3-class model retained (for the reference value of the covariates) 
##D plot(m3,which="baselinerisk",bty="l")
##D plot(m3,which="baselinerisk",ylim=c(0,5),bty="l")
##D plot(m3,which="survival",bty="l")
##D # class-specific predicted trajectories in the 3-class model retained 
##D # (with characteristics of subject ID=193)
##D data <- data_lcmm[data_lcmm$ID==193,]
##D plot(predictY(m3,var.time="Time",newdata=data,bty="l")
##D # predictive accuracy of the model evaluated with EPOCE
##D vect <- 1:15
##D cvpl <- epoce(m3,var.time="Time",pred.times=vect)
##D summary(cvpl)
##D plot(cvpl,bty="l",ylim=c(0,2))
##D ############## end of example ##############
## End(Not run)




