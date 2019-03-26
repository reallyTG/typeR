library(abd)


### Name: IntertidalAlgae
### Title: Intertidal Algae
### Aliases: IntertidalAlgae
### Keywords: datasets

### ** Examples

str(IntertidalAlgae)

# Using * includes the main effects and the interaction
aov.fit <- aov(sqrt.area ~ herbivores * height, data = IntertidalAlgae)
summary(aov.fit)
lm.fit <- lm(sqrt.area ~ herbivores * height, data = IntertidalAlgae)
anova(lm.fit)



