library(Zelig)


### Name: Zelig-tobit-bayes-class
### Title: Bayesian Tobit Regression
### Aliases: Zelig-tobit-bayes-class ztobitbayes

### ** Examples

data(turnout)
z.out <- zelig(vote ~ race + educate, model = "tobit.bayes",data = turnout, verbose = FALSE)




