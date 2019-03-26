library(plsRglm)


### Name: print.summary.plsRglmmodel
### Title: Print method for summaries of plsRglm models
### Aliases: print.summary.plsRglmmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modplsglm <- plsRglm(yCornell,XCornell,3,modele="pls-glm-gaussian")
class(modplsglm)
print(summary(modplsglm))
rm(list=c("XCornell","yCornell","modplsglm"))



