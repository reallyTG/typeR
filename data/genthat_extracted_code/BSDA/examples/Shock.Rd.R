library(BSDA)


### Name: Shock
### Title: Effect of experimental shock on time to complete difficult task
### Aliases: Shock
### Keywords: datasets

### ** Examples


boxplot(attempts ~ group, data = Shock, col = "violet")
model <- lm(attempts ~ group, data = Shock)
anova(model)
rm(model)





