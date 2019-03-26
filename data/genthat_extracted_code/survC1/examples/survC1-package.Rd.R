library(survC1)


### Name: survC1-package
### Title: C-statistics for risk prediction models with censored survival
###   data
### Aliases: survC1-package survC1
### Keywords: package

### ** Examples


#==============================================
# read sample data (PBC in survival package)
#==============================================
D=CompCase(pbc[1:200,c(2:4,10:14)]) 
D[,2]=as.numeric(D[,2]==2)

#==============================================
# Inference of C
#==============================================
tau=365.25*8
C=Inf.Cval(D, tau, itr=200)
round(c(C$Dhat, C$se, C$low95, C$upp95), digits=3)

#==============================================
# Inference of Delta C between 2 models
#==============================================
model0<-D[,c(1:2,4:5)] ; 
model1<-D
covs1<-as.matrix(model1[,c(-1,-2)])
covs0<-as.matrix(model0[,c(-1,-2)])

Delta=Inf.Cval.Delta(model0[,1:2], covs0, covs1, tau, itr=200)
round(Delta, digits=3)

#==============================================
# Point estimation via cross-validation
#==============================================
model1=D[,c(1,2,4)]

cvC(model1,tau,cvK=2,Rep=10)
    



