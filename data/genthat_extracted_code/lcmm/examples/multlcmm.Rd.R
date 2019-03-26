library(lcmm)


### Name: multlcmm
### Title: Estimation of mutlivariate mixed-effect models and multivariate
###   latent class mixed-effect models for multivariate longitudinal
###   outcomes of possibly multiple types (continuous Gaussian, continuous
###   non-Gaussian - curvilinear) that measure the same underlying latent
###   process.
### Aliases: multlcmm mlcmm

### ** Examples


## Not run: 
##D # Latent process mixed model for two curvilinear outcomes. Link functions are 
##D # aproximated by I-splines, the first one has 3 nodes (i.e. 1 internal node 8),
##D # the second one has 4 nodes (i.e. 2 internal nodes 12,25)
##D 
##D m1 <- multlcmm(Ydep1+Ydep2~1+Time*X2+contrast(X2),random=~1+Time,
##D subject="ID",randomY=TRUE,link=c("4-manual-splines","3-manual-splines"),
##D intnodes=c(8,12,25),data=data_lcmm)
##D 
##D # to reduce the computation time, the same model is estimated using 
##D # a vector of initial values
##D m1 <- multlcmm(Ydep1+Ydep2~1+Time*X2+contrast(X2),random=~1+Time,
##D subject="ID",randomY=TRUE,link=c("4-manual-splines","3-manual-splines"),
##D intnodes=c(8,12,25),data=data_lcmm, 
##D B=c(-1.071, -0.192,  0.106, -0.005, -0.193,  1.012,  0.870,  0.881,
##D   0.000,  0.000, -7.520,  1.401,  1.607 , 1.908,  1.431,  1.082,
##D  -7.528,  1.135 , 1.454 , 2.328, 1.052))
##D 
##D 
##D # output of the model
##D summary(m1)
##D # estimated link functions
##D plot(m1,which="linkfunction")
##D # variation percentages explained by linear mixed regression
##D VarExpl(m1,data.frame(Time=0))
##D 
##D #### Heterogeneous latent process mixed model with linear link functions 
##D #### and 2 latent classes of trajectory 
##D m2 <- multlcmm(Ydep1+Ydep2~1+Time*X2,random=~1+Time,subject="ID",
##D link="linear",ng=2,mixture=~1+Time,classmb=~1+X1,data=data_lcmm,
##D B=c( 18,-20.77,1.16,-1.41,-1.39,-0.32,0.16,-0.26,1.69,1.12,1.1,10.8,
##D 1.24,24.88,1.89))
##D # summary of the estimation
##D summary(m2)
##D # posterior classification
##D postprob(m2)
##D # longitudinal predictions in the outcomes scales for a given profile of covariates 
##D newdata <- data.frame(Time=seq(0,5,length=100),X1=rep(0,100),X2=rep(0,100),X3=rep(0,100))
##D predGH <- predictY(m2,newdata,var.time="Time",methInteg=0,nsim=20) 
##D head(predGH)
## End(Not run)




