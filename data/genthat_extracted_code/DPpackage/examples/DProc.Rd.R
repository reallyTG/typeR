library(DPpackage)


### Name: DProc
### Title: Semiparametric Bayesian ROC curve analysis using DPM of normals
### Aliases: DProc DProc.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ##############################################################
##D     # Fertility data example:
##D     # The following are Sperm Deformity Index (SDI) values from 
##D     # semen samples of men in an infertility study. They are 
##D     # divided into a "condition" present group defined as those 
##D     # whose partners achieved pregnancy and "condition" absent 
##D     # where there was no pregnancy.
##D     #
##D     # Aziz et al. (1996) Sperm deformity index: a reliable 
##D     # predictor of the outcome of fertilization in vitro. 
##D     # Fertility and Sterility, 66(6):1000-1008.
##D     #
##D     ##############################################################
##D     
##D      "pregnancy"<- c(165, 140, 154, 139, 134, 154, 120, 133, 
##D                      150, 146, 140, 114, 128, 131, 116, 128, 
##D                      122, 129, 145, 117, 140, 149, 116, 147, 
##D                      125, 149, 129, 157, 144, 123, 107, 129, 
##D                      152, 164, 134, 120, 148, 151, 149, 138, 
##D                      159, 169, 137, 151, 141, 145, 135, 135, 
##D                      153, 125, 159, 148, 142, 130, 111, 140, 
##D                      136, 142, 139, 137, 187, 154, 151, 149, 
##D                      148, 157, 159, 143, 124, 141, 114, 136, 
##D                      110, 129, 145, 132, 125, 149, 146, 138, 
##D                      151, 147, 154, 147, 158, 156, 156, 128, 
##D                      151, 138, 193, 131, 127, 129, 120, 159, 
##D                      147, 159, 156, 143, 149, 160, 126, 136, 
##D                      150, 136, 151, 140, 145, 140, 134, 140, 
##D                      138, 144, 140, 140)
##D 
##D      "nopregnancy"<-c(159, 136, 149, 156, 191, 169, 194, 182, 
##D                       163, 152, 145, 176, 122, 141, 172, 162, 
##D                       165, 184, 239, 178, 178, 164, 185, 154, 
##D                       164, 140, 207, 214, 165, 183, 218, 142, 
##D                       161, 168, 181, 162, 166, 150, 205, 163, 
##D                       166, 176)
##D 
##D 
##D     #########################################################
##D     # Estimating the ROC curve from the data
##D     #########################################################
##D 
##D     # Initial state
##D 
##D       statex <- NULL
##D       statey <- NULL
##D 
##D     # Prior information
##D 
##D       priorx <-list(alpha=10,m2=rep(0,1),
##D                     s2=diag(100000,1),
##D                     psiinv2=solve(diag(5,1)),
##D                     nu1=6,nu2=4,
##D                     tau1=1,tau2=100)
##D 
##D       priory <-list(alpha=20,m2=rep(0,1),
##D                     s2=diag(100000,1),
##D                     psiinv2=solve(diag(2,1)),
##D                     nu1=6,nu2=4,
##D                     tau1=1,tau2=100)
##D 
##D     # MCMC parameters
##D 
##D       nburn<-1000
##D       nsave<-2000
##D       nskip<-0
##D       ndisplay<-100
##D 
##D       mcmcx <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                     ndisplay=ndisplay)
##D       mcmcy <- mcmcx
##D 
##D     # Estimating the ROC
##D 
##D       fit1<-DProc(x=pregnancy,y=nopregnancy,priorx=priorx,priory=priory,
##D                   mcmcx=mcmcx,mcmcy=mcmcy,statex=statex,statey=statey,
##D                   statusx=TRUE,statusy=TRUE)
##D       fit1
##D       plot(fit1)
##D       
##D       
##D     #########################################################
##D     # Estimating the ROC curve from DPdensity objects
##D     #########################################################
##D      
##D       fitx<-DPdensity(y=pregnancy,prior=priorx,mcmc=mcmcx,
##D                       state=statex,status=TRUE)
##D      
##D       fity<-DPdensity(y=nopregnancy,prior=priory,mcmc=mcmcy,
##D                       state=statey,status=TRUE)
##D  
##D     # Estimating the ROC
##D 
##D       fit2<-DProc(fitx=fitx,fity=fity)
##D       
##D       fit2
##D       plot(fit2)
##D       
## End(Not run)



