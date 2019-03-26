library(locfit)


### Name: none
### Title: Locfit Evaluation Structure
### Aliases: none
### Keywords: smooth

### ** Examples

data(ethanol, package="locfit")
# fit a fourth degree polynomial using locfit
fit <- locfit(NOx~E,data=ethanol,deg=4,ev=none())
plot(fit,get.data=TRUE)



