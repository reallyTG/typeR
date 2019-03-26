library(BSDA)


### Name: Wastewat
### Title: Volume of injected waste water from Rocky Mountain Arsenal and
###   number of earthquakes near Denver
### Aliases: Wastewat
### Keywords: datasets

### ** Examples


plot(number ~ gallons, data = Wastewat)
model <- lm(number ~ gallons, data = Wastewat)
summary(model)
anova(model)
plot(model, which = 2)




