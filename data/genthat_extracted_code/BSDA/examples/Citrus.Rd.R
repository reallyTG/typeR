library(BSDA)


### Name: Citrus
### Title: Percent of peak bone density of different aged children
### Aliases: Citrus
### Keywords: datasets

### ** Examples


model <- lm(percent ~ age, data = Citrus)
summary(model)
anova(model)
rm(model)




