library(decisionSupport)


### Name: sample_CPT
### Title: Sample a Conditional Probability Table
### Aliases: sample_CPT
### Keywords: ~kwd1 ~kwd2

### ** Examples


test_CPT<-make_CPT(parent_effects=list(c(-1,3),c(-4,2),c(-2,3,4),c(1,2,3)),
                  parent_weights=c(1,1,1,1),b=2,child_prior=c(1,2,3,4,5),
                  child_states=c("a","b","c","d","e"),
                  parent_states=list(c("low","high"),c("A","B"),c(1,2,3),
                  c("Left","Right","Center")))

sample_CPT(CPT=test_CPT,states=c("low","A","2","Left"))




