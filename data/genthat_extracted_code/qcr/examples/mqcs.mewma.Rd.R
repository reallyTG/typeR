library(qcr)


### Name: mqcs.mewma
### Title: Function to plot mewma chart
### Aliases: mqcs.mewma mqcs.mewma.default mqcs.mewma.mqcd

### ** Examples


##
##  Continuous data 
##
library(qcr)
data(dowel1)
str(dowel1)
data.mqcd <- mqcd(dowel1)
res.mqcs <- mqcs.mewma(data.mqcd)
summary(res.mqcs)
plot(res.mqcs, title =" MEWMA Control Chart for dowel1")



