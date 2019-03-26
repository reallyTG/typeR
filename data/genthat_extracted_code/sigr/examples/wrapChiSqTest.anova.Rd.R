library(sigr)


### Name: wrapChiSqTest.anova
### Title: Format ChiSqTest from anova of logistic model.
### Aliases: wrapChiSqTest.anova

### ** Examples


d <- data.frame(x1= c(1,2,3,4,5,6,7,7),
                x2= c(1,0,3,0,5,0,7,0),
                y= c(TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE))
model <- glm(y~x1+x2, data=d, family=binomial)
summary(model)
render(wrapChiSqTest(model),
       pLargeCutoff=1, format='ascii')
anov <- anova(model)
print(anov)
lapply(sigr::wrapChiSqTest(anov),
       function(ti) {
         sigr::render(ti,
                      pLargeCutoff= 1,
                      pSmallCutoff= 0,
                      statDigits=4,
                      sigDigits=4,
                      format='ascii')
       })




