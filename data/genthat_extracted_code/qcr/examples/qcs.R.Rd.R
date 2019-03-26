library(qcr)


### Name: qcs.R
### Title: Function to plot Shewhart R chart
### Aliases: qcs.R qcs.R.default qcs.R.qcd

### ** Examples


##
##  Continuous data 
##
library(qcr)
data(pistonrings)
str(pistonrings)
pistonrings.qcd<-qcd(pistonrings)

class(pistonrings.qcd)

res.qcs <- qcs.R(pistonrings.qcd)
class(res.qcs)
plot(res.qcs,title="Control Chart R for pistonrings")
summary(res.qcs)  




