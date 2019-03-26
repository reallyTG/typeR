library(BSDA)


### Name: Nascar
### Title: Efficiency of pit crews for three major NASCAR teams
### Aliases: Nascar
### Keywords: datasets

### ** Examples


boxplot(time ~ team, data = Nascar, col = rainbow(3))
model <- lm(time ~ factor(team), data = Nascar)
summary(model)
anova(model)
rm(model)




