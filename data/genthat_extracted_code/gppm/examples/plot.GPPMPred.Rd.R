library(gppm)


### Name: plot.GPPMPred
### Title: Plotting predictions
### Aliases: plot.GPPMPred

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
plot(predRes,1)
## End(No test)



