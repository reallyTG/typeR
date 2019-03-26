library(corlink)


### Name: linkd
### Title: Function to impute missing agreement patterns and then to link
###   data
### Aliases: linkd
### Keywords: EM Feligi/Sunter, algorithm, class, correlation latent
###   linkage, probabilistic

### ** Examples


# Simulate data
m_probs <- rep(0.8,6)
u_probs <- rep(0.2,6)
means_match <- -1*qnorm(1-m_probs)
means_mismatch <- -1*qnorm(1-u_probs)
missingprobs <- rep(.2,6)
thedata <- do_sim(cor_match=0.2,cor_mismatch=0,nsample=10^4,pi_match=.5,
m_probs=rep(0.8,5),u_probs=rep(0.2,5),missingprobs=rep(0.4,5))
colnames(thedata) <- c(paste("V",1:5,sep="_"),"count")
output <- linkd(thedata)
output$fitted_probs



