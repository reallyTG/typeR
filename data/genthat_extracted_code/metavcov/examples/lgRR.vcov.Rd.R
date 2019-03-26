library(metavcov)


### Name: lgRR.vcov
### Title: Covariance matrix for log risk ratios
### Aliases: lgRR.vcov

### ** Examples

##########################################################################
# Example: Geeganage2010 data
# Preparing log risk ratios and covariances for multivariate meta-analysis
##########################################################################
data(Geeganage2010)
## set the correlation coefficients list r
r12=0.71
r.Gee=lapply(1:nrow(Geeganage2010),function(i){matrix(c(1,r12,r12,1),2,2)})


computvocv<-lgRR.vcov(nt=subset(Geeganage2010, select=c(nt_DD,nt_D)),
                      nc=subset(Geeganage2010, select=c(nc_DD,nc_D)),
                      st=subset(Geeganage2010, select=c(st_DD,st_D)),
                      sc=subset(Geeganage2010, select=c(sc_DD,sc_D)),
                      r=r.Gee)
# name computed log risk ratio as an input
Input =computvocv$lgRR
colnames(Input)=c("lgRR.DD","lgRR.D")
# name variance-covariance matrix of trnasformed z scores as covars
covars = computvocv$lgRR.cov
###############################################################
# Running random-effects model using package "mvmeta"
################################################################
#library(mvmeta)
#mvmeta_RE = summary(mvmeta(cbind(lgRR.DD,lgRR.D),
#                            S=covars,data=as.data.frame(Input),
#                            method="reml"))
#mvmeta_RE



