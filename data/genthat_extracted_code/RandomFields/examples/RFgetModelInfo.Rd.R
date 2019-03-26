library(RandomFields)


### Name: RFgetModelInfo
### Title: Information on RMmodels
### Aliases: RFgetModelInfo RFgetModelInfo_register RFgetModelInfo_model
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMexp(scale=4, var=2) + RMnugget(var=3) + RMtrend(mean=1)
z <- RFsimulate(model, 1:4, storing=TRUE)
RFgetModelInfo()

model <-  RMwhittle(scale=NA, var=NA, nu=NA) + RMnugget(var=NA)
RFgetModelInfo(model)
## Don't show: 
FinalizeExample()
## End(Don't show)


