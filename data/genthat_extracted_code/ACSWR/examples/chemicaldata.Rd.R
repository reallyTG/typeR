library(ACSWR)


### Name: chemicaldata
### Title: Chemical Reaction Experiment
### Aliases: chemicaldata
### Keywords: canonical correlation

### ** Examples

data(chemicaldata)
names(chemicaldata)
chemicaldata$x12 <- chemicaldata$x1*chemicaldata$x2; 
chemicaldata$x13 <- chemicaldata$x1*chemicaldata$x3; 
chemicaldata$x23 <- chemicaldata$x2*chemicaldata$x3
chemicaldata$x1sq <- chemicaldata$x1^{2}
chemicaldata$x2sq <- chemicaldata$x2^{2}
chemicaldata$x3sq <- chemicaldata$x3^{2}
S_Total <- cov(chemicaldata)
cancor_xy <- sqrt(eigen(solve(S_Total[1:3,1:3])%*%S_Total[1:3,
4:12]%*%solve(S_Total[4:12,4:12])%*%S_Total[4:12,1:3])$values)
cancor_xy
cancor(chemicaldata[,1:3],chemicaldata[,4:12])



