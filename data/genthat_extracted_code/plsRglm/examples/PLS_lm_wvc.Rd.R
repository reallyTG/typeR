library(plsRglm)


### Name: PLS_lm_wvc
### Title: Light version of PLS\_lm for cross validation purposes
### Aliases: PLS_lm_wvc
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
PLS_lm_wvc(dataY=yCornell,dataX=XCornell,nt=3,dataPredictY=XCornell[1,])
PLS_lm_wvc(dataY=yCornell[-c(1,2)],dataX=XCornell[-c(1,2),],nt=3,dataPredictY=XCornell[c(1,2),])
PLS_lm_wvc(dataY=yCornell[-c(1,2)],dataX=XCornell[-c(1,2),],nt=3,dataPredictY=XCornell[c(1,2),],
keepcoeffs=TRUE)
rm("XCornell","yCornell")

## With an incomplete dataset (X[1,2] is NA)
data(pine)
ypine <- pine[,11]
data(XpineNAX21)
PLS_lm_wvc(dataY=ypine[-1],dataX=XpineNAX21[-1,],nt=3)
PLS_lm_wvc(dataY=ypine[-1],dataX=XpineNAX21[-1,],nt=3,dataPredictY=XpineNAX21[1,])
PLS_lm_wvc(dataY=ypine[-2],dataX=XpineNAX21[-2,],nt=3,dataPredictY=XpineNAX21[2,])
PLS_lm_wvc(dataY=ypine,dataX=XpineNAX21,nt=3)
rm("XpineNAX21","ypine")



