library(EasyMx)


### Name: emxRegressionModel
### Title: Create a regression model
### Aliases: emxRegressionModel emxModelRegression

### ** Examples

   
# Example
require(EasyMx)
data(myRegDataRaw)
myrdr <- myRegDataRaw
myrdr[1, 4] <- NA

run <- emxRegressionModel(y~1+x*z, data=myrdr, run=TRUE)
summary(run)

summary(lm(y~1+x*z, data=myrdr))






