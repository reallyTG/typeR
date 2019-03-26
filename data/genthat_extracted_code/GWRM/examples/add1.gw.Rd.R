library(GWRM)


### Name: add1.gw
### Title: Add All Possible Single Terms to a GWRM Model
### Aliases: add1.gw

### ** Examples

data(goals)
fit0 <- gw(goals ~ offset(log(played)), data = goals)
summary(fit0)

fit1 <- add1(fit0, ~ position)
summary(fit1)



