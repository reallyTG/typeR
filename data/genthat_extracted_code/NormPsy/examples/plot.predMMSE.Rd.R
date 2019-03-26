library(NormPsy)


### Name: plot.predMMSE
### Title: Plot of predicted scores in the natural scale of the
###   psychometric test
### Aliases: plot.predMMSE

### ** Examples

#import data paquid from lcmm package
library(lcmm)
data(paquid)

#normalization of MMSE scores
paquid$MMSEnorm <- normMMSE(paquid$MMSE)

#estimation of a linear mixed model on the normalized data
m <- hlme(MMSEnorm~I(age-65)*CEP, random=~I(age-65), subject="ID", data=paquid)

#prediction of MMSE scores in the 0-30 scale
pred <- predictMMSE(m,VarTime="age",Timelim=c(65,85),nTime=30,
Xprofile=c(CEP=1),methInteg='MC',nsim=200,draws=FALSE)     

#plot of the predictions
plot(pred)



