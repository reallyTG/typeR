library(metavcov)


### Name: mix.vcov
### Title: Covariance matrix for mixed effect sizes
### Aliases: mix.vcov

### ** Examples

#########################################################################
# Example: Geeganage2010 data
# Preparing covariances for multivariate meta analysis
# Choose variable SBP, DBP, DD, D with effect sizes "MD","MD","RD","lgOR"
#########################################################################
data(Geeganage2010)
## set the correlation coefficients list r
r12=0.71
r13=0.5
r14=0.25
r23=0.6
r24=0.16
r34=0.16
r<-vec2sm(c(r12,r13,r14,r23,r24,r34),diag=FALSE)
diag(r)=1
mix.r=lapply(1:nrow(Geeganage2010),function(i){r})
attach(Geeganage2010)
## compute variance co-variances
computvocv<-mix.vcov(type=c("MD","MD","RD","lgOR"),
                     d=cbind(MD_SBP,MD_DBP,NA,NA),
                     sdt=cbind(sdt_SBP,sdt_DBP,NA,NA),
                     sdc=cbind(sdc_SBP,sdc_DBP,NA,NA),
                     nt=cbind(nt_SBP,nt_DBP,nt_DD,nt_D),
                     nc=cbind(nc_SBP,nc_DBP,nc_DD,nc_D),
                     st=cbind(NA,NA,st_DD,st_D),
                     sc=cbind(NA,NA,sc_DD,sc_D),
                     r=mix.r)
# name different effect sizes as an input
Input =subset(Geeganage2010, select=c(MD_SBP,MD_DBP))
Input$RD_DD=st_DD/nt_DD-sc_DD/nc_DD
Input$lgOR_D=log((st_D/(nt_D-st_D))/(sc_D/(nc_D-sc_D)))
# name variance-covariance matrix as covars
covars = computvocv$mix.cov
###############################################
# Running random-effects model using package "mvmeta"
###############################################
#library(mvmeta)
#mvmeta_RE = summary(mvmeta(cbind(MD_SBP,MD_DBP,RD_DD,lgOR_D),
#                           S=covars,data=Input,method="reml"))
#mvmeta_RE



