library(BSDA)


### Name: Precinct
### Title: Robbery rates versus percent low income in eight precincts
### Aliases: Precinct
### Keywords: datasets

### ** Examples


plot(rate ~ income, data = Precinct)
model <- (lm(rate ~ income, data = Precinct))
abline(model, col = "red")
rm(model)




