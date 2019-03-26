library(lcmm)


### Name: plot
### Title: Plot of a fitted model
### Aliases: plot plot.hlme plot.lcmm plot.multlcmm plot.Jointlcmm

### ** Examples



###################### fit, residuals and postprob 

# estimation of the model
m<-lcmm(Y~Time*X1,mixture=~Time,random=~Time,classmb=~X2+X3,
subject='ID',ng=2,data=data_hlme,B=c(0.41,0.55,-0.18,-0.41,
-14.26,-0.34,1.33,13.51,24.65,2.98,1.18,26.26,0.97))  

# fit
plot(m,which="fit",marg=FALSE,var.time="Time",bty="n")
# residuals plot
plot(m)
# postprob plot
plot(m,which="postprob") 


###################### fit, linkfunctions

#### Estimation of homogeneous mixed models with different assumed link
#### functions, a quadratic mean trajectory for the latent process with 
#### independent random intercept, slope and quadratic slope
#### (comparison of linear, Beta and 3 and 5 splines link functions)
## Not run: 
##D 
##D # linear link function
##D m10<-lcmm(Ydep2~Time+I(Time^2),random=~Time+I(Time^2),subject='ID',ng=1,
##D           data=data_lcmm,link="linear",
##D           B=c(-0.7454, -0.2031,  0.2715,  0.2916 , 0.6114, -0.0064,  0.0545,
##D               0.0128, 25.3795, 2.2371))
##D             
##D # Beta link function
##D m11<-lcmm(Ydep2~Time+I(Time^2),random=~Time+I(Time^2),subject='ID',ng=1,
##D           data=data_lcmm,link="beta",B=c(-0.9109, -0.0831,  0.5194,  0.1910 ,
##D           0.8984, -0.0179, -0.0636,  0.0045,  0.5514, -0.7692,  0.7037,  0.0899))
##D           
##D # fit 
##D par(mfrow=c(2,1),mar=c(4,4,1,1))
##D plot(m11,which="fit",var.time="Time",bty="l",ylim=c(-3,0))
##D plot(m11,which="fit",var.time="Time",marg=FALSE,bty="l",ylim=c(-3,0))
##D 
##D # I-splines with 3 equidistant nodes
##D m12<-lcmm(Ydep2~Time+I(Time^2),random=~Time+I(Time^2),subject='ID',ng=1,
##D           data=data_lcmm,link="3-equi-splines",B=c(-0.9272, -0.0753 , 0.5304, 
##D           0.1950,  0.9260, -0.0204, -0.0739 , 0.0059, -7.8369,  0.9228 ,-1.4689,
##D           2.0396,  1.8102))
##D 
##D # I-splines with 5 nodes, and interior nodes entered manually
##D m13<-lcmm(Ydep2~Time+I(Time^2),random=~Time+I(Time^2),subject='ID',ng=1,
##D           data=data_lcmm,link="5-manual-splines",intnodes=c(10,20,25),
##D           B=c(-0.9315, -0.0739 , 0.5254 , 0.1933,  0.9418, -0.0206, -0.0776,
##D           0.0064, -7.8645, 0.7470,  1.2080,  1.5537 , 1.7558 , 1.3386 , 1.0982))
##D 
##D # Plot of estimated different link functions:
##D # (applicable for models that only differ in the "link function" used. 
##D # Otherwise, the latent process scale is different and a rescaling
##D # is necessary)
##D plot(m10,which="linkfunction",bty="l")
##D plot(m11,which="linkfunction",bty="l",add=TRUE,col=2)
##D plot(m12,which="linkfunction",bty="l",add=TRUE,col=3)
##D plot(m13,which="linkfunction",bty="l",add=TRUE,col=4)
##D legend("topleft",col=1:4,legend=c("linear","beta","3-Isplines","5-Isplines"),lty=1,bty='n')
## End(Not run)


###################### fit, baselinerisk and survival
## Not run: 
##D #### estimation with 3 latent classes (ng=3) - see Jointlcmm 
##D #### help for details on the model
##D m3 <- Jointlcmm(fixed= Ydep1~Time*X1,mixture=~Time,random=~Time,
##D classmb=~X3,subject='ID',survival = Surv(Tevent,Event)~ X1+mixture(X2),
##D hazard="3-quant-splines",hazardtype="PH",ng=3,data=data_lcmm,
##D B=c(0.7576, 0.4095, -0.8232, -0.2737, 0, 0, 0, 0.2838, -0.6338, 
##D 2.6324, 5.3963, -0.0273, 1.3979, 0.8168, -15.041, 10.164, 10.2394, 
##D 11.5109, -2.6219, -0.4553, -0.6055, 1.473, -0.0383, 0.8512, 0.0389, 
##D 0.2624, 1.4982))
##D 
##D # fit
##D plot(m3,which="fit",var.time="Time",bty="l")
##D plot(m3,which="fit",var.time="Time",marg=FALSE,bty="l",ylim=c(0,15))
##D 
##D 
##D # Class-specific predicted baseline risk & survival functions in the 
##D # 3-class model retained (for the reference value of the covariates) 
##D plot(m3,which="baselinerisk",bty="l")
##D plot(m3,which="baselinerisk",ylim=c(0,5),bty="l")
##D plot(m3,which="survival",bty="l")
## End(Not run)





