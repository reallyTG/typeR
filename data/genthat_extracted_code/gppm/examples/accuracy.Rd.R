library(gppm)


### Name: accuracy
### Title: Accuracy Estimates for Predictions
### Aliases: accuracy

### ** Examples

## No test: 
data("demoLGCM")
#remove all measurements from person 1 and the first form person 2
predIdx <- c(which(demoLGCM$ID==1),which(demoLGCM$ID==2)[1])
fitDemoLGCM <- demoLGCM[setdiff(1:nrow(demoLGCM),predIdx),]

lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
             fitDemoLGCM,'ID','y')
lgcm <- fit(lgcm)
predRes <- predict(lgcm,demoLGCM[predIdx,])
accEsts <- accuracy(predRes)
accEsts$MSE #mean squared error
accEsts$nLPP #negative log-predictive probability
## End(No test)



