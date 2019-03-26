library(BSDA)


### Name: Lifespan
### Title: Life span of electronic components used in a spacecraft versus
###   heat
### Aliases: Lifespan
### Keywords: datasets

### ** Examples


plot(life ~ heat, data = Lifespan)
model <- lm(life ~ heat, data = Lifespan)
abline(model, col = "red")
resid(model)
sum((resid(model))^2)
anova(model)
rm(model)




