library(gppm)


### Name: simulate.GPPM
### Title: Simulate from a Gaussian process panel model
### Aliases: simulate.GPPM

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','x')

parameterValues <- c(10,-1,0,10,0,0.1)
names(parameterValues) <-c('muI','muS','varI','varS','covIS','sigma')
simData <- simulate(lgcm,parameterValues=parameterValues)
## End(No test)



