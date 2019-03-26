library(Umpire)


### Name: SurvivalModel-class
### Title: The "SurvivalModel" Class
### Aliases: SurvivalModel-class SurvivalModel rand,SurvivalModel-method
### Keywords: classes datagen

### ** Examples

showClass("SurvivalModel")
sm <- SurvivalModel()
## Generate data from base model
outcome <- rand(sm, 100)
summary(outcome)
## Generate data from five classes with different beta parameters
beta <- rep(rnorm(5, 0, 2), each=20)
outcome <- rand(sm, 100, beta=beta)
summary(outcome)



