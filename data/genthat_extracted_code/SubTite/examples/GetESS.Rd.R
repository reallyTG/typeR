library(SubTite)


### Name: GetESS
### Title: Determines Prior ESS for fixed values of sigma_alpha^2 and
###   sigmabeta^2
### Aliases: GetESS

### ** Examples

###Specify the prior hypermeans
meanmu=-.5
meanslope=-.05
MeanInts = c(-.5,-.1)
MeanSlopes = c(.1,0)
Dose=sort(rnorm(5))
varint=5
varbeta=1
GetESS(Dose,meanmu,meanslope,MeanInts,MeanSlopes,varint,varbeta)



