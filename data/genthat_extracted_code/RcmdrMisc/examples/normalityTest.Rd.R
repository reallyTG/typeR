library(RcmdrMisc)


### Name: normalityTest
### Title: Normality Tests
### Aliases: normalityTest normalityTest.default normalityTest.formula
### Keywords: htest

### ** Examples

  data(Prestige, package="car")
  with(Prestige, normalityTest(income))
  normalityTest(income ~ type, data=Prestige, test="ad.test")
  normalityTest(~income, data=Prestige, test="pearson.test", n.classes=5)



