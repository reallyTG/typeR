library(Zelig)


### Name: Zelig-probit-gee-class
### Title: Generalized Estimating Equation for Probit Regression
### Aliases: Zelig-probit-gee-class zprobitgee

### ** Examples

data(turnout)
turnout$cluster <- rep(c(1:200), 10)
sorted.turnout <- turnout[order(turnout$cluster),]
z.out1 <- zelig(vote ~ race + educate, model = "probit.gee",
id = "cluster", data = sorted.turnout)
summary(z.out1)




