library(TauStar)


### Name: tauStarTest
### Title: Test of Independence Using the Tau* Measure
### Aliases: tauStarTest

### ** Examples

set.seed(123)
x = rnorm(100)
y = rnorm(100)
testResults = tauStarTest(x,y)
print(testResults$pVal) # big p-value

y = y + x # make x and y correlated
testResults = tauStarTest(x,y)
print(testResults$pVal) # small p-value



