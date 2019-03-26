library(AdapEnetClass)


### Name: MCLcleaned
### Title: Mantle cell lymphoma cleaned data
### Aliases: MCLcleaned
### Keywords: dataset

### ** Examples

#Enet.wls: Elastic net on the weighted data Using MCLcleaned data attached with this package
## No test: 
data(MCLcleaned)
## End(No test)
## No test: 
GEval<-MCLcleaned[4:577]
## End(No test)
## No test: 
enet<-Enet.wls(GEval, log(MCLcleaned@time), MCLcleaned@cens)
## End(No test)
## No test: 
enet
## End(No test)



