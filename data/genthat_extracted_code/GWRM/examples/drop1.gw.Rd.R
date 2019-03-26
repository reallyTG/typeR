library(GWRM)


### Name: drop1.gw
### Title: Drop All Possible Single Terms to a GWRM Model
### Aliases: drop1.gw

### ** Examples

data(goals)

fit0 <- gw(goals ~ offset(log(played)), data = goals)
summary(fit0)

fit1 <- step(fit0, ~ position)
summary(fit1)



