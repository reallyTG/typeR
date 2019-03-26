library(ALSM)


### Name: modelval
### Title: Model Validation
### Aliases: modelval

### ** Examples


#### page 373 (table)
b<-SurgicalUnit
p<-SurgicalUnitAdditional

modelval(b[,c(1,2,3,8)],b[,10],p[,c(1,2,3,8)],p[,10])
modelval(b[,c(1,2,3,5,6,8)],b[,10],p[,c(1,2,3,5,6,8)],p[,10])



