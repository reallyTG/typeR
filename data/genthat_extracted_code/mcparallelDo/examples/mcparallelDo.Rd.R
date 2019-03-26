library(mcparallelDo)


### Name: mcparallelDo
### Title: mcparallelDo
### Aliases: %mcpDo% mcparallelDo

### ** Examples

## Create data
data(ToothGrowth)
## Trigger mcparallelDo to perform analysis on a fork
mcparallelDo({glm(len ~ supp * dose, data=ToothGrowth)},"interactionPredictorModel")
## Do other things
binaryPredictorModel <- glm(len ~ supp, data=ToothGrowth)
gaussianPredictorModel <- glm(len ~ dose, data=ToothGrowth)
## The result from mcparallelDo returns in your targetEnvironment, 
## e.g. .GlobalEnv, when it is complete with a message (by default)
summary(interactionPredictorModel)

# Example of not returning a value until we return to the top level
for (i in 1:10) {
  if (i == 1) {
    mcparallelDo({2+2}, targetValue = "output")
  }
  if (exists("output")) print(i)
}

# Example of getting a value without returning to the top level
for (i in 1:10) {
  if (i == 1) {
    mcparallelDo({2+2}, targetValue = "output")
  }
  mcparallelDoCheck()
  if (exists("output")) print(i)
}

# Example of dispatching as assignment
targetValueWithoutQuotes %mcpDo% sample(LETTERS, 10)




