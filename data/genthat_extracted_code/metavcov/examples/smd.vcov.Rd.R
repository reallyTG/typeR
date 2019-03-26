library(metavcov)


### Name: smd.vcov
### Title: Covariance matrix for standardized mean differences
### Aliases: smd.vcov

### ** Examples

######################################################
# Example: Geeganage2010 data
# Preparing covarianceS for multivariate meta-analysis
######################################################
data(Geeganage2010)
## set the correlation coefficients list r
r12=0.71
r.Gee=lapply(1:nrow(Geeganage2010),function(i){matrix(c(1,r12,r12,1),2,2)})

computvocv<-smd.vcov(nt=subset(Geeganage2010, select=c(nt_SBP,nt_DBP)),
               nc=subset(Geeganage2010, select=c(nc_SBP,nc_DBP)),
               d=subset(Geeganage2010, select=c(SMD_SBP,SMD_DBP)),r=r.Gee)
# name variance-covariance matrix as covars
covars = computvocv$smd.cov
#####################################################
# Running random-effects model using package "mvmeta"
#####################################################
#library(mvmeta)
#mvmeta_RE = summary(mvmeta(cbind(SMD_SBP,SMD_DBP),
#                     S=covars,
#                     data=subset(Geeganage2010,select=c(SMD_SBP,SMD_DBP)),
#                     method="reml"))
#mvmeta_RE



