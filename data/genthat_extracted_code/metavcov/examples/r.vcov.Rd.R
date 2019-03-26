library(metavcov)


### Name: r.vcov
### Title: Covariance matrix for correlation coefficients
### Aliases: r.vcov

### ** Examples

  ######################################################
  # Example: Craft2003 data
  # Preparing covariances for multivariate meta-analysis
  ######################################################
  data(Craft2003)
  #extract correlation from the dataset (craft)
  corflat= subset(Craft2003, select=C1:C6)
  # transform correlations to z and compute variance-covariance matrix.
  computvocv=r.vcov(n=Craft2003$N,corflat=corflat,method="average")
  # name transformed z scores as an input
  Input =computvocv$zr
  # name variance-covariance matrix of trnasformed z scores as covars
  covars = computvocv$zcov
  #####################################################
  # Running random-effects model using package "mvmeta"
  #####################################################
  #library(mvmeta)
  #mvmeta_RE = summary(mvmeta(cbind(C1,C2,C3,C4,C5,C6),
  #                           S=covars,data=Input,method="reml"))
  #mvmeta_RE
  ##############################################################
  # Another example:
  # Checking the example in Harris Cooper et al.'s book page 388
  ##############################################################
r1=c(-0.074,-0.127,0.324,0.523,-0.416,-0.414)
r=rbind(r1,r1) ### the r.vcov is to handle at least two studies
n=c(142,142)
computvcov=r.vcov(n=n,corflat=r,method="average")
round(computvcov$list.rcov[[1]],4)
round(computvcov$list.zcov[[1]],4)



