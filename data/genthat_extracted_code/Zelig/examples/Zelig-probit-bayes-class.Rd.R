library(Zelig)


### Name: Zelig-probit-bayes-class
### Title: Bayesian Probit Regression
### Aliases: Zelig-probit-bayes-class zprobitbayes

### ** Examples

data(turnout)
z.out <- zelig(vote ~ race + educate, model = "probit.bayes",data = turnout, verbose = FALSE)
summary(z.out)




