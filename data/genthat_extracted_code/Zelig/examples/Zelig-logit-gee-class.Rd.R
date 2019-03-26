library(Zelig)


### Name: Zelig-logit-gee-class
### Title: Generalized Estimating Equation for Logit Regression
### Aliases: Zelig-logit-gee-class zlogitgee

### ** Examples


data(turnout)
turnout$cluster <- rep(c(1:200), 10)
sorted.turnout <- turnout[order(turnout$cluster),]

z.out1 <- zelig(vote ~ race + educate, model = "logit.gee",
id = "cluster", data = sorted.turnout)

summary(z.out1)
x.out1 <- setx(z.out1)
s.out1 <- sim(z.out1, x = x.out1)
summary(s.out1)
plot(s.out1)




