library(Zelig)


### Name: Zelig-probit-class
### Title: Probit Regression for Dichotomous Dependent Variables
### Aliases: Zelig-probit-class zprobit

### ** Examples

data(turnout)
z.out <- zelig(vote ~ race + educate, model = "probit", data = turnout)
summary(z.out)
x.out <- setx(z.out)
s.out <- sim(z.out, x = x.out)
summary(s.out)
plot(s.out)




