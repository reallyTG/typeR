library(BSDA)


### Name: Shkdrug
### Title: Effects of a drug and electroshock therapy on the ability to
###   solve simple tasks
### Aliases: Shkdrug
### Keywords: datasets

### ** Examples


boxplot(response ~ treatment, data = Shkdrug, col = "gray")
model <- lm(response ~ treatment, data = Shkdrug)
anova(model)
rm(model)




