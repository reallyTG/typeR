library(qcr)


### Name: qcs.S
### Title: Function to plot Shewhart S chart
### Aliases: qcs.S qcs.S.default qcs.S.qcd

### ** Examples


##
##  Continuous data 
##
library(qcr)
data(pistonrings)
str(pistonrings)
pistonrings.qcd<-qcd(pistonrings)

class(pistonrings.qcd)

res.qcs <- qcs.S(pistonrings.qcd)
class(res.qcs)
plot(res.qcs,title="Control Chart S for pistonrings")
summary(res.qcs)  




