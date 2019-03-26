library(FAMoS)


### Name: model.appr
### Title: Test for Model Appropriateness
### Aliases: model.appr

### ** Examples

#define the models to be checked
model1 <- c(1,2,5)
model2 <- c(1,4,5)
#define the critical conditions
crits <- list(c(2,3))

#test the models
model.appr(current.parms = model1, critical.parms = crits)
model.appr(current.parms = model2, critical.parms = crits)



