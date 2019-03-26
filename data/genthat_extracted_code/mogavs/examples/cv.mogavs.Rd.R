library(mogavs)


### Name: cv.mogavs
### Title: k-Fold Crossvalidation for a mogavs model
### Aliases: cv.mogavs
### Keywords: models regression

### ** Examples

data(sampleData)
mod<-mogavs(y~.,data=sampleData,maxGenerations=20)
cv.mogavs(mod,nvar=3,data=sampleData,y_ind=1,K=10,R=1,order=FALSE)



