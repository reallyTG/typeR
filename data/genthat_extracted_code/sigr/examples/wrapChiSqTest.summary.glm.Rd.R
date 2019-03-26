library(sigr)


### Name: wrapChiSqTest.summary.glm
### Title: Format ChiSqTest from model summary.
### Aliases: wrapChiSqTest.summary.glm

### ** Examples


d <- data.frame(x=c(1,2,3,4,5,6,7,7),
      y=c(TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE))
model <- glm(y~x,data=d,family=binomial)
sum <- summary(model)
render(wrapChiSqTest(sum),pLargeCutoff=1,format='ascii')





