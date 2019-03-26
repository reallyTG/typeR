library(Zelig)


### Name: Zelig-logit-bayes-class
### Title: Bayesian Logit Regression
### Aliases: Zelig-logit-bayes-class zlogitbayes

### ** Examples

data(turnout)
z.out <- zelig(vote ~ race + educate, model = "logit.bayes",data = turnout, verbose = FALSE)




