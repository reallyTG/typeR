library(SPmlficmcm)


### Name: Spmlficmcm
### Title: Semiparametric maximum likelihood for interaction in case-mother
###   control-mother
### Aliases: Spmlficmcm
### Keywords: semiparametric maximum likelihood case-mother

### ** Examples

# 1-Creation of database
## Not run: 
##D   set.seed(13200)
##D   M=20000;
##D   fl=outc~X1+X2+gm+gnch+X1:gnch+X2:gm;
##D   theta=0.3
##D   beta=c(-0.916,0.857,0.588,0.405,-0.693,0.488)
##D   interc=-2.23
##D   vpo=c(3,4)
##D   vprob=c(0.35,0.55)
##D   vcorr=c(2,1)
##D   Dataf<-FtSmlrmCMCM(fl,M,theta,beta,interc,vpo,vprob,vcorr)
##D   rho<-table(Dataf$outc)[2]/20000 # Disease prevalence
##D          
##D   # Number of subjects eligible to the study in the population 
##D   N=c(dim(Dataf[Dataf$outc==0,])[1],dim(Dataf[Dataf$outc==1,])[1])
##D          
##D   # Sampling of the study database  
##D   n0=1232;n1=327; 
##D   DatfE1<-SeltcEch("outc",n1,n0,"obs",Dataf)
##D 
##D 
##D # 2 Creation of missing data on the offspring genotype 
##D         DatfE=DatfE1 
##D         gnch<-DatfE["gnch"]
##D         gnch<-as.vector(gnch[,1])
##D         gnch1<-sample(c(0,1),length(gnch),replace=TRUE,prob=c(0.91,0.09))
##D         gnch[gnch1==1]<-NA
##D         DatfE=DatfE1
##D         DatfE$gnch<-NULL;DatfE$gnch<-gnch
##D # 3 Creation of the two databases 
##D       # DatfEcd :complete data
##D       # DatfEmd :data with missing genotypes for a subset of children.
##D         DatfEcd<-DatfE[is.na(DatfE["gnch"])!=TRUE,]
##D         DatfEmd<-DatfE
##D         rm(gnch);rm(gnch1) 
##D # data obtained
##D DatfEcd[26:30,]
##D DatfEmd[26:30,]
##D 
##D ##4 Estimation of parameters=======================================================
##D ## model equation         
##D fl=outc~X1+X2+gm+gnch+X1:gnch+X2:gm;
##D ## Estimation of the parameters (no missing data)
##D         # N = (N0,N1) is available
##D         Rsnm1<-Spmlficmcm(fl,N,"gm","gnch",DatfEcd,1)
##D         #solution of the nonlinear system
##D         round(Rsnm1$Uim,digits=3)
##D         #estimates
##D         round(Rsnm1$MatR,digits=3)
##D         #variance - covariance matrix
##D         round(Rsnm1$Matv,digits=5)
##D         # N = (N0,N1) is not available
##D         Rsnm2<-Spmlficmcm(fl=fl,gmname="gm",gcname="gnch",DatfE=DatfEcd,typ=1,p=rho)
##D         #solution of the nonlinear system
##D         round(Rsnm2$Uim,digits=3)
##D         #estimates
##D         round(Rsnm2$MatR,digits=3)
##D         #variance - covariance matrix
##D         round(Rsnm2$Matv,digits=5)
##D ## Estimation of the parameters (with missing data)
##D         # N = (N0,N1) is available
##D         Rswm1<-Spmlficmcm(fl,N,"gm","gnch",DatfEmd,typ=2)
##D         #solution of the nonlinear system
##D         round(Rswm1$Uim,digits=3)
##D         #estimates
##D         round(Rswm1$MatR,digits=3)
##D         #variance - covariance matrix
##D         round(Rswm1$Matv,digits=5)
##D         # N = (N0,N1) is not available
##D         Rswm2<-Spmlficmcm(fl=fl,gmname="gm",gcname="gnch",DatfE=DatfEmd,typ=2,p=rho)
##D         #solution of the nonlinear system
##D         round(Rswm2$Uim,digits=3)
##D         #estimates
##D         round(Rswm2$MatR,digits=3)
##D         #variance - covariance matrix
##D         round(Rswm2$Matv,digits=5)
## End(Not run)



