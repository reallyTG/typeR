library(mdhglm)


### Name: jointfit
### Title: Fitting Multivariate Double Hierarchical Generalized Linear
###   Models using h-likelihood Approach
### Aliases: jointfit

### ** Examples

data(eg)
eg1<-eg[1:100,] ## using sampled data to have faster results 

jm1<-DHGLMMODELING(Link="identity", LinPred=y1~dose+dose2+(1|litter),RandDist="gaussian")
jm2<-DHGLMMODELING(Link="logit", LinPred=y2~dose+dose2+(1|litter),RandDist="gaussian")

Init_Corr=list(c(0))
SSC=list(as.factor(c(eg1$litter,eg1$litter)),as.factor(c(eg1$litter,eg1$litter)))
EstimateOverDisp=c(TRUE,FALSE)
LaplaceFixed=c(TRUE,TRUE)
ZZ1<-model.matrix(~as.factor(eg1$litter)-1)
ZZCorr=list(ZZ1,ZZ1)

#### independent random-effects model ####
res_ind<-jointfit(RespDist=c("gaussian","binomial"),DataMain=list(eg1,eg1),
    MeanModel=list(jm1,jm2),structure="correlated",
    Init_Corr=Init_Corr,EstimateCorrelations=FALSE,convergence=1,ZZCorr=ZZCorr)

#### correlated random-effects model ####
res_corr<-jointfit(RespDist=c("gaussian","binomial"),DataMain=list(eg1,eg1),
    MeanModel=list(jm1,jm2),structure="correlated",
    Init_Corr=Init_Corr,convergence=1,ZZCorr=ZZCorr)

#### shared random-effects model ####
Init_Corr=c(1,-10)
res_saturated<-jointfit(RespDist=c("gaussian","binomial"),DataMain=list(eg1,eg1),
    MeanModel=list(jm1,jm2),structure="shared",
    Init_Corr=Init_Corr,convergence=1)



