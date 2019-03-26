library(corlink)


### Name: do_sim
### Title: Function to simulate agreement patterns for record pairs from a
###   mixture model
### Aliases: do_sim
### Keywords: internal

### ** Examples

m_probs <- rep(0.8,6)
u_probs <- rep(0.2,6)
means_match <- -1*qnorm(1-m_probs)
means_mismatch <- -1*qnorm(1-u_probs)
missingprobs <- rep(.2,6)
thedata <- do_sim(cor_match=0.2,cor_mismatch=0,nsample=10^4,
pi_match=.5,m_probs=rep(0.8,5),u_probs=rep(0.2,5),missingprobs=rep(0.4,5))
thedata



