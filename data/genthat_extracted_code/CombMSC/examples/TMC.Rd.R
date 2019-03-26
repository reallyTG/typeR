library(CombMSC)


### Name: TMC
### Title: Compare model selection criteria
### Aliases: TMC
### Keywords: models

### ** Examples


# Regression example
vars <- rnorm(60)
dim(vars)<- c(20,3)
vars <- data.frame(vars)

result <- TMC(num.Iter = 3, model.List = make.Model.List.Reg(vars), msc.List = list(BIC, AIC, PRESS), var.Frame = vars)

# Time Series Example
modList <- make.Model.List.TS(c(1,0,1,0,0,1))

result2 <- TMC(num.Iter = 3,model.List = modList, msc.List = list(BIC, holdout.Mean,
AIC), test.Size = 10)



