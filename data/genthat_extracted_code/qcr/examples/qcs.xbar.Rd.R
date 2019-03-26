library(qcr)


### Name: qcs.xbar
### Title: Function to plot the Shewhart xbar chart
### Aliases: qcs.xbar qcs.xbar.default qcs.xbar.qcd

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

x <- droplevels(pistonrings[1:125,])
y <- droplevels(pistonrings[126:200,])

res.qcs <- qcs.xbar(x, data.name="Control Chart Xbar for pistonrings")
plot(res.qcs)

res.qcs <- qcs.add(x = res.qcs, value = y[,c(1,2)]) 
plot(res.qcs)
summary(res.qcs)


res.qcs <- qcs.xbar(pistonrings.qcd, std.dev="UWAVE-SD")
class(res.qcs)
plot(res.qcs,title="Control Chart Xbar for pistonrings (UWAVE-SD)")
summary(res.qcs)  




