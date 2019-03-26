library(metavcov)


### Name: rd.vcov
### Title: Covariance matrix for risk differences
### Aliases: rd.vcov

### ** Examples

###########################################################################
# Example: Geeganage2010 data
# Preparing risk differences and covariances for multivariate meta-analysis
###########################################################################
data(Geeganage2010)
## set the correlation coefficients list r
r12=0.71
r.Gee=lapply(1:nrow(Geeganage2010),function(i){matrix(c(1,r12,r12,1),2,2)})


computvocv<-rd.vcov(nt=subset(Geeganage2010, select=c(nt_DD,nt_D)),
                      nc=subset(Geeganage2010, select=c(nc_DD,nc_D)),
                      st=subset(Geeganage2010, select=c(st_DD,st_D)),
                      sc=subset(Geeganage2010, select=c(sc_DD,sc_D)),
                      r=r.Gee)
# name computed relative risk as an input
Input =computvocv$rd
colnames(Input)=c("rd.DD","rd.D")
# name variance-covariance matrix of trnasformed z scores as covars
covars = computvocv$rd.cov
###############################################################
# Running random-effects model using package "mvmeta"
################################################################
#library(mvmeta)
#mvmeta_RE = summary(mvmeta(cbind(rd.DD,rd.D),
#                          S=covars,data=as.data.frame(Input),
#                          method="reml"))
#mvmeta_RE



