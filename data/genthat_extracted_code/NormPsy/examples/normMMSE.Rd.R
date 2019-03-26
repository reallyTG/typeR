library(NormPsy)


### Name: normMMSE
### Title: Normalized scores for the Mini Mental State Examination (MMSE)
### Aliases: normMMSE

### ** Examples


#import data paquid from lcmm package
library(lcmm)
data(paquid)

# computation of the normalized MMSE
paquid$MMSEnorm <- normMMSE(paquid$MMSE)

# histogram of these data
par(mfrow=c(1,2))
hist(paquid$MMSE,breaks=seq(-0.5,30.5,1),col=2,main="crude MMSE")
hist(paquid$MMSEnorm,breaks=seq(0,100,10),col=3,main="normalized MMSE")



