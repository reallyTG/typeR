library(sdnet)


### Name: cnDot-method
### Title: Network Description File
### Aliases: cnDot cnDot,catNetwork-method
###   cnDot,catNetwork,character-method
###   cnDot,catNetwork,character-method,character-method
###   cnDot,matrix-method cnDot,matrix,character-method
###   cnDot,matrix,character-method,character-method cnDot,list-method
###   cnDot,list,character-method
###   cnDot,list,character-method,character-method
### Keywords: methods graphs aplot

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxpars=3, numcats=2)
  cnDot(object=cnet, file="cnet")



