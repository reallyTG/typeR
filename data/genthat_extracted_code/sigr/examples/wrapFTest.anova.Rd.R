library(sigr)


### Name: wrapFTest.anova
### Title: Wrap quality statistic of a linear relation from anova.
### Aliases: wrapFTest.anova

### ** Examples


d <- data.frame(x1 = c(1,2,3,4,5,6,7,7),
                x2 = c(1,0,3,0,5,6,0,7),
                y =  c(1,1,2,2,3,3,4,4))
model <- lm(y~x1+x2, data=d)
summary(model)
sigr::wrapFTest(model)
anov <- stats::anova(model)
print(anov)
lapply(sigr::wrapFTest(anov),
       function(ti) {
         sigr::render(ti,
                      pLargeCutoff= 1,
                      pSmallCutoff= 0,
                      statDigits=4,
                      sigDigits=4,
                      format='ascii')
       })




