library(CUB)


### Name: summary.GEM
### Title: S3 method: summary for class "GEM"
### Aliases: summary.GEM
### Keywords: package

### ** Examples

model<-GEM(Formula(MeetRelatives~0|0|0),family="cube",data=relgoods) 
summary(model,correlation=TRUE,digits=4)




