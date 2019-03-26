library(Zelig)


### Name: Zelig-mlogit-bayes-class
### Title: Bayesian Multinomial Logistic Regression
### Aliases: Zelig-mlogit-bayes-class zmlogitbayes

### ** Examples

data(mexico)
z.out <- zelig(vote88 ~ pristr + othcok + othsocok,model = "mlogit.bayes",
data = mexico,verbose = FALSE)




