library(Zelig)


### Name: Zelig-logit-class
### Title: Logistic Regression for Dichotomous Dependent Variables
### Aliases: Zelig-logit-class zlogit

### ** Examples

library(Zelig)
data(turnout)
z.out1 <- zelig(vote ~ age + race, model = "logit", data = turnout,
                cite = FALSE)
summary(z.out1)
summary(z.out1, odds_ratios = TRUE)
x.out1 <- setx(z.out1, age = 36, race = "white")
s.out1 <- sim(z.out1, x = x.out1)
summary(s.out1)
plot(s.out1)




