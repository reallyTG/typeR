library(qcr)


### Name: mqcs.mcusum
### Title: Function to plot mcusum chart
### Aliases: mqcs.mcusum mqcs.mcusum.default mqcs.mcusum.mqcd

### ** Examples


##
##  Continuous data 
##
library(qcr)
data(dowel1)
str(dowel1)
data.mqcd <- mqcd(dowel1)
res.mqcs <- mqcs.mcusum(data.mqcd)
summary(res.mqcs)
plot(res.mqcs, title =" MCUSUM Control Chart for dowel1")



