library(BSDA)


### Name: Orange
### Title: Price of oranges versus size of the harvest
### Aliases: Orange
### Keywords: datasets

### ** Examples


plot(price ~ harvest, data = Orange)
model <- lm(price ~ harvest, data = Orange)
abline(model, col = "red")
summary(model)
rm(model)




