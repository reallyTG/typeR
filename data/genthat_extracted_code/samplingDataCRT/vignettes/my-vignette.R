## ----loadPAckage,echo=TRUE-----------------------------------------------
#load the package
library(samplingDataCRT)
library(lme4)

## ----designMarix.SWD, echo=TRUE------------------------------------------

I<-6 #number of cluster
K<-4  #number of  timecpoints

#Design matrix for parallel study, see Table 1
sw<-3 #number of cluster switches
designMatrix(nC=I, nT=K, nSw=sw, design="parallel")

#Design matrix for cross-over study, see Table 1
designMatrix(nC=I, nT=K, nSw=sw, design="cross-over")
#if swP is set, then the timepoint of switch is setted manually 
designMatrix(nC=I, nT=K, nSw=sw, swP=1, design="cross-over")

#Design matrix for SWD study, see Table 1
sw<-2 #number of cluster switches
designMatrix(nC=I, nT=K, nSw=sw)


## ----completeDataDesignMatrix--------------------------------------------

K<-4  #number of  time points
J<-2 #number of subjects, each cluster and timepoint

##### for parallel study #####

I<-4 #number of cluster
sw<-2 #number of cluster switches
# create a design matrix
(X<-designMatrix(nC=I, nT=K, nSw=sw, design="parallel"))
# create the corresponding complete data design matrix
completeDataDesignMatrix(J, X)

##### for cross-over study #####

# create a design matrix 
(X<-designMatrix(nC=I, nT=K, nSw=sw, design="cross-over"))
# create the corresponding complete data design matrix
completeDataDesignMatrix(J, X)

##### for SWD study #####

I<-3 #number of cluster
# create a design matrix
(X<-designMatrix(nC=I, nT=K, nSw=1)) 
# create the corresponding complete data design matrix
completeDataDesignMatrix(J, X)


## ----CovarianeMatrices, echo=TRUE----------------------------------------
#study design parameter
K<-3  #number of measurement (or timepoints)
I<-2 #number of cluster
J<-2 #number of subjects

### for cross-sectional data
sigma.1<-0.1
sigma.3<-0.9
CovMat.Design(K, J, I, 
              sigma.1.q=sigma.1, sigma.3.q=sigma.3)
 
### for longitudinal data
sigma.1<-0.1
sigma.2<-0.4
sigma.3<-0.9
CovMat.Design(K, J, I,
              sigma.1.q=sigma.1, sigma.2.q=sigma.2, sigma.3.q=sigma.3)

## ----Sample data parallel, echo=TRUE, message=FALSE----------------------
#desing parameter
K<-4  #number of  time points
J<-25 #number of subjects, each cluster and timepoint

#variances of each level
sigma.1<-0.1
sigma.2<-0.4
sigma.3<-0.9

#regression paramters
mu.0<-0
theta<-1
betas<-rep(0, K-1)
parameters<-c(mu.0, betas, theta)

##### for parallel study #####

I<-4 #number of cluster
sw<-2 #number of cluster switches
# create a design matrix
X<-designMatrix(nC=I, nT=K, nSw=sw, design="parallel")
# create the corresponding complete data design matrix
D<-completeDataDesignMatrix(J, X)
#performe covariance-Variance matrix for longitudinal design
V<-CovMat.Design(K, J, I, sigma.1.q=sigma.1, sigma.2.q=sigma.2, sigma.3.q=sigma.3)
#sample data within the design
sample.data<-sampleData(type = "long", K=K,J=J,I=I, D=D, V=V, parameters=parameters)

#need the lme4 package for analysis
lmer(val~intervention+measurement + (1|cluster)+(1|subject), data=sample.data)

## ----Sample data parallel simulation, echo=FALSE, message=FALSE----------
# res.all<-NULL
# for(s in 1:50){
#   #sample data within the design
#   sample.data<-sampleData(type = "long", K=K,J=J,I=I, D=D, V=V, parameters=parameters)
#   #analysis of the three-level data
#   lm.res<-lmer(val~intervention+measurement + (1|cluster)+(1|subject), data=sample.data)
#   #random effects
#   res<-as.data.frame(summary(lm.res)$varcor)[,5]
#   names(res)<-as.data.frame(summary(lm.res)$varcor)[,1]
#   #fixed effects
#   res<-c(res,fixef(lm.res))
#   res.all<-rbind(res.all, res)
# }
# 
# #boxplot(res.all[,"cluster"])
# mean(res.all[,"cluster"]) #0.9
# #boxplot(res.all[,"subject"])
# mean(res.all[,"subject"])#0.4
# #boxplot(res.all[,"Residual"])
# mean(res.all[,"Residual"])#0.1
# 
# #mean(res.all[,"(Intercept)"])#0
# mean(res.all[,"intervention"])#1
# # mean(res.all[,"measurement2"])#0
# # mean(res.all[,"measurement3"])#0
# # mean(res.all[,"measurement4"])#0

## ----Sample data cross-over, echo=TRUE, message=FALSE--------------------
# ##### for cross-over study #####

# create a design matrix 
X<-designMatrix(nC=I, nT=K, nSw=sw, design="cross-over")
# create the corresponding complete data design matrix
D<-completeDataDesignMatrix(J, X)
#performe covariance-Variance matrix for longitudinal design
V<-CovMat.Design(K, J, I, sigma.1.q=sigma.1, sigma.2.q=sigma.2, sigma.3.q=sigma.3)
#sample data within the design
sample.data<-sampleData(type = "long", K=K,J=J,I=I, D=D, V=V, parameters=parameters)

#analysis of the three-level data
lmer(val~intervention+measurement + (1|cluster)+(1|subject), data=sample.data)


## ----Sample data cross-over simulation, echo=FALSE, message=FALSE--------
# res.all<-NULL
# for(s in 1:50){
#   #sample data within the design
#   sample.data<-sampleData(type = "long", K=K,J=J,I=I, D=D, V=V, parameters=parameters)
#   #analysis of the three-level data
#   lm.res<-lmer(val~intervention+measurement + (1|cluster)+(1|subject), data=sample.data)
#   #random effects
#   res<-as.data.frame(summary(lm.res)$varcor)[,5]
#   names(res)<-as.data.frame(summary(lm.res)$varcor)[,1]
#   #fixed effects
#   res<-c(res,fixef(lm.res))
#   res.all<-rbind(res.all, res)
# }
# 
# #boxplot(res.all[,"cluster"])
# mean(res.all[,"cluster"]) #0.9
# #boxplot(res.all[,"subject"])
# mean(res.all[,"subject"])#0.4
# #boxplot(res.all[,"Residual"])
# mean(res.all[,"Residual"])#0.1
# 
# #mean(res.all[,"(Intercept)"])#0
# mean(res.all[,"intervention"])#1
# # mean(res.all[,"measurement2"])#0
# # mean(res.all[,"measurement3"])#0
# # mean(res.all[,"measurement4"])#0

## ----Sample data SWD, echo=TRUE, message=FALSE---------------------------
##### for SWD study #####

I<-3 #number of cluster
# create a design matrix
X<-designMatrix(nC=I, nT=K, nSw=1) 
# create the corresponding complete data design matrix
D<-completeDataDesignMatrix(J, X)
#performe covariance-Variance matrix for cross-sectional design
V<-CovMat.Design(K, J, I, sigma.1=sigma.1, sigma.3=sigma.3)
#sample data within the design
sample.data<-sampleData(type = "cross-sec", K=K,J=J,I=I, D=D, V=V, parameters=parameters)

#analysis of the two-leveldata
lmer(val~intervention+measurement + (1|cluster), data=sample.data)


## ----Sample data SWD simulation, echo=FALSE, message=FALSE---------------
# res.all<-NULL
# for(s in 1:50){
#   #sample data within the design
#   sample.data<-sampleData(type = "long", K=K,J=J,I=I, D=D, V=V, parameters=parameters)
#   #analysis of the three-level data
#   lm.res<-lmer(val~intervention+measurement + (1|cluster), data=sample.data)
#   #random effects
#   res<-as.data.frame(summary(lm.res)$varcor)[,5]
#   names(res)<-as.data.frame(summary(lm.res)$varcor)[,1]
#   #fixed effects
#   res<-c(res,fixef(lm.res))
#   res.all<-rbind(res.all, res)
# }
# 
# #boxplot(res.all[,"cluster"])
# mean(res.all[,"cluster"]) #0.9
# #boxplot(res.all[,"subject"])
# #mean(res.all[,"subject"])#0.4
# #boxplot(res.all[,"Residual"])
# mean(res.all[,"Residual"])#0.1
# 
# #mean(res.all[,"(Intercept)"])#0
# mean(res.all[,"intervention"])#1
# # mean(res.all[,"measurement2"])#0
# # mean(res.all[,"measurement3"])#0
# # mean(res.all[,"measurement4"])#0

## ----power, echo=TRUE----------------------------------------------------

noCl<-10
noT<-6
switches<-2
DM<-designMatrix(noCl,noT,switches)
sigma.e <- 2
sigma.alpha <- 2   
#Power for cross-sectional SWD design by formula of Hussey&Hughes 
calcPower.SWD(ThetaEst=1,Design=DM, sigmaq=sigma.e^2, tauq=sigma.alpha^2, time=FALSE)

#Power for longitudinal SWD design by formula of Heo&Kim 
#Example Heo&Kim Table 1
###Table 1, 1 row
delta<- 0.3# treatment effect
DM.new<-NULL
for(i in 1:dim(DM)[2]){
DM.new<-cbind(DM.new,DM[,i], DM[,i])
}
DM.new
sigma.e <- sqrt(7/10)
sigma <- sqrt(2/10)
sigma.alpha <- sqrt(1/10 )
K<- 10 #number of participants within each 'cell'
calcPower.SWD(ThetaEst=delta, Design=DM.new, 
              tauq=sigma.alpha^2, sigmaq=sigma^2, sigmaq.error =sigma.e^2,  
              noSub=K, type="longitudinal")

