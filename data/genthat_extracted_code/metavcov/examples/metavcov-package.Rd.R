library(metavcov)


### Name: metavcov-package
### Title: Variances and Covariances for Multivariate Meta-Analysis
### Aliases: metavcov-package metavcov

### ** Examples

###############################################
# Effect size : correlation coefficients
###############################################
data(Craft2003)
computvocv=r.vcov(n=Craft2003$N,
                  corflat=subset(Craft2003, select=C1:C6),
                  method="average")
# name transformed z scores as an input
Input =computvocv$zr
# name variance covariance matrix of trnasformed z scores as covars
covars = computvocv$zcov
# Next step: Overall analysis: Running random effects model
#                              using package "mvmeta"
#library(mvmeta)
#mvmeta_RE = summary(mvmeta(cbind(C1,C2,C3,C4,C5,C6),
#                           S=covars,data=Input,method="reml"))
#mvmeta_RE



