library(decisionSupport)


### Name: sample_simple_CPT
### Title: Make Conditional Probability tables using the likelihood method
### Aliases: sample_simple_CPT
### Keywords: ~kwd1 ~kwd2

### ** Examples


parent_list<-list(pare1=c(5,3),parent2=c(3,2),PARE3=c(4,5))
sample_simple_CPT(parent_list,5)
sample_simple_CPT(parent_list,5,obs_states=c("very high","medium","high"))

sample_simple_CPT(parent_list=list(management_intensity=c(5,2),inputs=c(5,1)),5,
     obs_states=c("medium","very high"))$sampled




