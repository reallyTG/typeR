library(Omisc)


### Name: BCa
### Title: BCa
### Aliases: BCa

### ** Examples

data<-DFSimulated()
boots<-NaiveBoot(data, groups="Rs", keepgroups=TRUE)
boots<-bootAnalysis(boots, cbind, DFanalysis, 1,2,3, robust=FALSE)
BCa(boots, data, .025,.975, accelleration="bootstrap", DFanalysis, 1,2,3, robust=FALSE)




