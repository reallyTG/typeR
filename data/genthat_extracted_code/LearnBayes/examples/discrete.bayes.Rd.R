library(LearnBayes)


### Name: discrete.bayes
### Title: Posterior distribution with discrete priors
### Aliases: discrete.bayes print.bayes plot.bayes summary.bayes
### Keywords: models

### ** Examples

prior=c(.25,.25,.25,.25)
names(prior)=c(.2,.25,.3,.35)
y=5
n=10
discrete.bayes(dbinom,prior,y,size=n)



