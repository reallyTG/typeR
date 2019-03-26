library(DivMelt)


### Name: modelDivMelt
### Title: Routine to generate LASSO model for the Diversity Assay Analysis
###   Tool
### Aliases: modelDivMelt
### Keywords: utilities

### ** Examples

library (DivMelt)
pkgDir<-system.file(package="DivMelt")
modelDivMelt(trngFile=paste(pkgDir,"/sample_data/training.csv",sep=''),datFile="new_model.rda")



