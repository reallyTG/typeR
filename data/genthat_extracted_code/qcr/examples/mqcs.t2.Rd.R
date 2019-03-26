library(qcr)


### Name: mqcs.t2
### Title: Function to plot t2 Hotelling chart
### Aliases: mqcs.t2 mqcs.t2.default mqcs.t2.mqcd

### ** Examples


##
##  Continuous data 
##
library(qcr)
data(dowel1)
str(dowel1)
data.mqcd <- mqcd(dowel1)
res.mqcs <- mqcs.t2(data.mqcd)
summary(res.mqcs)
plot(res.mqcs, title =" Hotelling Control Chart for dowel1")

data(archery1)
str(archery1)
data.mqcd <- mqcd(archery1)
res.mqcs <- mqcs.t2(data.mqcd)
summary(res.mqcs)
plot(res.mqcs, title =" Hotelling Control Chart for archery1")



