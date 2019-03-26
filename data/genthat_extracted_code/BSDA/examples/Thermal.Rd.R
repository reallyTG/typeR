library(BSDA)


### Name: Thermal
### Title: Heat loss of thermal pane windows versus outside temperature
### Aliases: Thermal
### Keywords: datasets

### ** Examples


model <- lm(loss ~ temp, data = Thermal)
summary(model)
plot(loss ~ temp, data = Thermal)
abline(model, col = "red")
rm(model)




