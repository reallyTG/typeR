library(lcmm)


### Name: predictlink
### Title: Confidence intervals for the estimated link functions from
###   'lcmm', 'Jointlcmm' and 'multlcmm'
### Aliases: predictlink predictlink.lcmm predictlink.multlcmm
###   predictlink.Jointlcmm

### ** Examples


 ## Not run: 
##D 
##D ## Univariate mixed model with splines link funciton
##D m14<-lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1,
##D data=data_lcmm,link="5-manual-splines",intnodes=c(10,20,25),
##D B=c(-0.89255, -0.09715, 0.56335, 0.21967, 0.61937, -7.90261, 0.75149, 
##D -1.22357, 1.55832, 1.75324, 1.33834, 1.0968))
##D 
##D ##Transformed values of several scores and their confidence intervals
##D transf.m14 <- predictlink(m14,ndraws=2000,Yvalues=c(0,1,7:30))
##D plot(transf.m14)
##D 
##D 
##D ## Multivariate mixed model with splines link functions
##D m1 <- multlcmm(Ydep1+Ydep2~1+Time*X2+contrast(X2),random=~1+Time,
##D subject="ID",randomY=TRUE,link=c("4-manual-splines","3-manual-splines"),
##D intnodes=c(8,12,25),data=data_lcmm,
##D B=c(-1.071, -0.192,  0.106, -0.005, -0.193,  1.012,  0.870,  0.881,
##D   0.000,  0.000, -7.520,  1.401,  1.607 , 1.908,  1.431,  1.082,
##D  -7.528,  1.135 , 1.454 , 2.328, 1.052))
##D ##Confidence intervals for the transformed values (given in m1$estimlink)
##D transf.m1 <- predictlink(m1,ndraws=200)
##D plot(transf.m1)
## End(Not run)




