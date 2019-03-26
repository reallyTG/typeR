library(PowerNormal)


### Name: pn.bayes
### Title: Fit univariate PN distribution (Bayesian)
### Aliases: pn.bayes

### ** Examples


x <- rpn(100, 25)

pn.bayes(x)

pn.bayes(x, prior = 'Uniform')

pn.bayes(x, prior = 'Gamma', 1/100, 1/100)




