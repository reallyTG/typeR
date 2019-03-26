library(qcr)


### Name: state.control
### Title: Univariante process state
### Aliases: state.control

### ** Examples


##
##  Continuous data 
##
library(qcr)
data(pistonrings)
str(pistonrings)
pistonrings.qcd<-qcd(pistonrings)

class(pistonrings.qcd)

res.qcs <- qcs.xbar(pistonrings.qcd)
plot(res.qcs,title="Control Chart Xbar for pistonrings I")
summary(res.qcs)  

res.qcd <- state.control(res.qcs)
res.qcs <- qcs.xbar(res.qcd)
plot(res.qcs,title="Control Chart Xbar for pistonrings II")
summary(res.qcs)  

res.qcd <- state.control(res.qcs)
res.qcs <- qcs.xbar(res.qcd)
plot(res.qcs,title="Control Chart Xbar for pistonrings III")
summary(res.qcs)  




