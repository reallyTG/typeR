library(decisionSupport)


### Name: make_CPT
### Title: Make Conditional Probability tables using the likelihood method
### Aliases: make_CPT
### Keywords: "Bayesian "Likelihood CPT, Method" Network",

### ** Examples


make_CPT(parent_effects=list(c(-1,1),c(-0.5,0,0.5)),
  parent_weights=c(3,1),b=1.5,child_prior=c(.2,.6,.2),child_states=c("a","b","c"))

test_CPT<-make_CPT(parent_effects=list(c(-1,3),c(-4,2),c(-2,3,4),c(1,2,3)),
                  parent_weights=c(1,1,1,1),b=2,child_prior=c(1,2,3,4,5),
                  child_states=c("a","b","c","d","e"),
                  parent_states=list(c("low","high"),c("A","B"),c(1,2,3),c("Hi","Lunch","Bye")))





