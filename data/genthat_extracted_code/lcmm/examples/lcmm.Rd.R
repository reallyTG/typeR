library(lcmm)


### Name: lcmm
### Title: Estimation of mixed-effect models and latent class mixed-effect
###   models for different types of outcomes (continuous Gaussian,
###   continuous non-Gaussian or ordinal)
### Aliases: lcmm

### ** Examples


## Not run: 
##D #### Estimation of homogeneous mixed models with different assumed link
##D #### functions, a quadratic mean trajectory for the latent process and 
##D #### correlated random intercept and slope (the random quadratic slope 
##D #### was removed as it did not improve the fit of the data).
##D #### -- comparison of linear, Beta and 3 different splines link functions --
##D # linear link function
##D m10<-lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1,
##D data=data_lcmm,link="linear")
##D summary(m10)
##D # Beta link function
##D m11<-lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1,
##D data=data_lcmm,link="beta")
##D summary(m11)
##D plot(m11,which="linkfunction",bty="l")
##D # I-splines with 3 equidistant nodes
##D m12<-lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1,
##D data=data_lcmm,link="3-equi-splines")
##D summary(m12)
##D # I-splines with 5 nodes at quantiles
##D m13<-lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1,
##D data=data_lcmm,link="5-quant-splines")
##D summary(m13)
##D # I-splines with 5 nodes, and interior nodes entered manually
##D m14<-lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1,
##D data=data_lcmm,link="5-manual-splines",intnodes=c(10,20,25))
##D summary(m14)
##D plot(m14,which="linkfunction",bty="l")
##D 
##D 
##D # Thresholds
##D # Especially for the threshold link function, we recommend to estimate 
##D # models with increasing complexity and use estimates of previous ones 
##D # to specify plausible initial values (we remind that estimation of
##D # models with threshold link function involves a computationally demanding 
##D # numerical integration -here of size 3)
##D m15<-lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1
##D ,data=data_lcmm,link="thresholds",maxiter=100,
##D B=c(-0.8379, -0.1103,  0.3832,  0.3788 , 0.4524, -7.3180,  0.5917,  0.7364,
##D  0.6530, 0.4038,  0.4290,  0.6099,  0.6014 , 0.5354 , 0.5029 , 0.5463,
##D  0.5310 , 0.5352, 0.6498,  0.6653,  0.5851,  0.6525,  0.6701 , 0.6670 ,
##D  0.6767 , 0.7394 , 0.7426, 0.7153,  0.7702,  0.6421))
##D summary(m15)
##D plot(m15,which="linkfunction",bty="l")
##D 
##D #### Plot of estimated different link functions:
##D #### (applicable for models that only differ in the "link function" used. 
##D ####  Otherwise, the latent process scale is different and a rescaling
##D ####  is necessary)
##D plot(m10,which="linkfunction",col=1,xlab="latent process",ylab="marker",
##D bty="l",xlim=c(-10,5),legend=NULL)
##D plot(m11,which="linkfunction",add=TRUE,col=2,legend=NULL)
##D plot(m12,which="linkfunction",add=TRUE,col=3,legend=NULL)
##D plot(m13,which="linkfunction",add=TRUE,col=4,legend=NULL)
##D plot(m14,which="linkfunction",add=TRUE,col=5,legend=NULL)
##D plot(m15,which="linkfunction",add=TRUE,col=6,legend=NULL)
##D legend(x="bottomright",legend=c("linear","beta","spl_3e","spl_5q","spl_5m","thresholds"),
##D col=1:6,lty=1,inset=.02,box.lty=0)
##D 
##D #### Estimation of 2-latent class mixed models with different assumed link 
##D #### functions with individual and class specific linear trend
##D #### for illustration, only default initial values where used but other
##D #### sets of initial values should also be tried to ensure convergence 
##D #### towards the golbal maximum
##D # Linear link function
##D m20<-lcmm(Ydep2~Time,random=~Time,subject='ID',mixture=~Time,ng=2,
##D idiag=TRUE,data=data_lcmm,link="linear",B=c(-0.98,0.79,-2.09,
##D -0.81,0.19,0.55,24.49,2.24))
##D summary(m20)
##D postprob(m20)
##D # Beta link function
##D m21<-lcmm(Ydep2~Time,random=~Time,subject='ID',mixture=~Time,ng=2,
##D idiag=TRUE,data=data_lcmm,link="beta",B=c(-0.1,-0.56,-0.4,-1.77,
##D 0.53,0.14,0.6,-0.83,0.73,0.09))
##D summary(m21)
##D postprob(m21)
##D # I-splines link function (and 5 nodes at quantiles)
##D m22<-lcmm(Ydep2~Time,random=~Time,subject='ID',mixture=~Time,ng=2,
##D idiag=TRUE,data=data_lcmm,link="5-quant-splines",B=c(0.12,0.63,
##D -1.76,-0.39,0.51,0.13,-7.37,1.05,1.28,1.96,1.3,0.93,1.05))
##D summary(m22)
##D postprob(m22)
##D 
##D data <- data_lcmm[data_lcmm$ID==193,]
##D plot(predictL(m22,var.time="Time",newdata=data,bty="l")
##D 
## End(Not run)    




