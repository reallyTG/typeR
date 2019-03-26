library(BSDA)


### Name: Submarin
### Title: Number of German submarines sunk by U.S. Navy in World War II
### Aliases: Submarin
### Keywords: datasets

### ** Examples


model <- lm(actual ~ reported, data = Submarin)
summary(model)
plot(actual ~ reported, data = Submarin)
abline(model, col = "red")
rm(model)




