library(sigr)


### Name: wrapChiSqTest.glm
### Title: Format ChiSqTest from model.
### Aliases: wrapChiSqTest.glm

### ** Examples


d <- data.frame(x=c(1,2,3,4,5,6,7,7),
      y=c(TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE))
model <- glm(y~x,data=d,family=binomial)
summary(model)
render(wrapChiSqTest(model),pLargeCutoff=1,format='ascii')





