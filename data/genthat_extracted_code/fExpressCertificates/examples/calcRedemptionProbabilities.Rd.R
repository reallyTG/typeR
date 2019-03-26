library(fExpressCertificates)


### Name: Express Certificates Redemption Probabilities
### Title: Redemption Probabilities for Express Certificates
### Aliases: calcRedemptionProbabilities calcStopProbabilities
###   simRedemptionProbabilities MonteCarloStopProbabilities
### Keywords: math

### ** Examples

# Monte Carlo simulation of redemption probabilities 
# p(t_i) = P(S(t_i)>=X(t_i),\forall_{j<i} S(t_j)<X(t_j))
mc.loops <- 5000
probs <- simRedemptionProbabilities(S=100, X=c(100,100,100), T=c(1,2,3,4), 
  r=0.045, r_d=0, sigma=0.3, mc.steps=3000, mc.loops=5000)
table(probs$stops)/mc.loops

# Analytic calculation of redemption probabilities
probs2 <- calcRedemptionProbabilities(S=100, X=c(100,100,100), T=c(1,2,3,4), 
  r=0.045, r_d=0, sigma=0.3)
probs2



