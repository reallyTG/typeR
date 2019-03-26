library(metavcov)


### Name: md.vcov
### Title: Covariance matrix for mean differences
### Aliases: md.vcov

### ** Examples

######################################################
# Example: Geeganage2010 data
# Preparing covariances for multivariate meta-analysis
######################################################
## set the correlation coefficients list r
r12=0.71
r.Gee=lapply(1:nrow(Geeganage2010),function(i){matrix(c(1,r12,r12,1),2,2)})

computvocv<-md.vcov(nt=subset(Geeganage2010, select=c(nt_SBP,nt_DBP)),
                    nc=subset(Geeganage2010, select=c(nc_SBP,nc_DBP)),
                    sdt=subset(Geeganage2010, select=c(sdt_SBP,sdt_DBP)),
                    sdc=subset(Geeganage2010, select=c(sdc_SBP,sdc_DBP)),
                    r=r.Gee)
# name variance-covariance matrix as covars
covars = computvocv$md.cov

#####################################################
# Running random-effects model using package "mvmeta"
#####################################################
#library(mvmeta)
#mvmeta_RE = summary(mvmeta(cbind(MD_SBP,MD_DBP),S=covars,
#                         data=subset(Geeganage2010,select=c(MD_SBP,MD_DBP)),
#                         method="reml"))
#mvmeta_RE



