library(BSDA)


### Name: Poverty
### Title: Percent poverty and crime rate for selected cities
### Aliases: Poverty
### Keywords: datasets

### ** Examples


plot(poverty ~ crime, data = Poverty)
model <- lm(poverty ~ crime, data = Poverty)
abline(model, col = "red")
summary(model)
rm(model)




