library(processR)


### Name: modelsSummaryTable
### Title: Make Summary Table for Model Coefficients
### Aliases: modelsSummaryTable

### ** Examples

## No test: 
fit1=lm(mpg~wt,data=mtcars)
fit2=lm(mpg~wt*hp,data=mtcars)
fit3=lm(mpg~wt*hp*am,data=mtcars)
x=modelsSummary(list(fit1))
modelsSummaryTable(x)
x=modelsSummary(list(fit1,fit2))
modelsSummaryTable(x,vanilla=FALSE)
x=modelsSummary(list(fit1,fit2,fit3))
modelsSummaryTable(x)
## End(No test)



