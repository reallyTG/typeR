library(heplots)


### Name: AddHealth
### Title: Adolescent Health Data
### Aliases: AddHealth
### Keywords: datasets

### ** Examples

data(AddHealth)
# fit mlm
AH.mod <- lm(cbind(depression, anxiety) ~ grade, data=AddHealth)

Anova(AH.mod)
summary(Anova(AH.mod))

heplot(AH.mod, hypotheses="grade.L", fill=c(TRUE, FALSE))



