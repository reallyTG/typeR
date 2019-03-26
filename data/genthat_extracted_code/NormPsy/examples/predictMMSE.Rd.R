library(NormPsy)


### Name: predictMMSE
### Title: Prediction of MMSE scores in their natural scale.
### Aliases: predictMMSE

### ** Examples


#import data paquid from lcmm package
library(lcmm)
data(paquid)

# computation of the normalized MMSE
paquid$MMSEnorm <- normMMSE(paquid$MMSE)

# estimation of a model on the normalized MMSE scores
m <- hlme(MMSEnorm~I(age-65)*CEP, random=~I(age-65), subject="ID", data=paquid)

# prediction from the model in the natural scale of MMSE
predictMMSE(m,VarTime="age",Timelim=c(65,85),nTime=30,
Xprofile=c(CEP=1),methInteg='MC',nsim=200,draws=FALSE)




