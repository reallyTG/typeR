library(DAAG)


### Name: mifem
### Title: Mortality Outcomes for Females Suffering Myocardial Infarction
### Aliases: mifem
### Keywords: datasets

### ** Examples

print("CART - Example 10.7")
summary(mifem)
pause()

require(rpart)
mifem.rpart <- rpart(outcome ~ ., data = mifem, cp = 0.0025)
plotcp(mifem.rpart)
printcp(mifem.rpart)
pause()

mifemb.rpart <- prune(mifem.rpart, cp=0.006)
print(mifemb.rpart)



