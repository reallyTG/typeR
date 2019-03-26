library(plm)


### Name: vcovG
### Title: Generic Lego building block for Robust Covariance Matrix
###   Estimators
### Aliases: vcovG vcovG.plm vcovG.pcce
### Keywords: regression

### ** Examples

data("Produc", package="plm")
zz <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp, data=Produc,
model="pooling")
## reproduce Arellano's covariance matrix
vcovG(zz, cluster="group", inner="cluster", l=0)
## use in coefficient significance test
library(lmtest)
## define custom covariance function
## (in this example, same as vcovHC)
myvcov <- function(x) vcovG(x, cluster="group", inner="cluster", l=0)
## robust significance test
coeftest(zz, vcov.=myvcov)



