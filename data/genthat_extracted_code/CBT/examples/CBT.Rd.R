library(CBT)


### Name: CBT
### Title: Confidence Bound Target (CBT) Algorithm
### Aliases: CBT Emp_CBT Ana_CBT Uniform_Prior Sine_Prior Cosine_Prior
### Keywords: Confidence Bound Multi-armed Bandit

### ** Examples

R = 1000

cum_regret = numeric(R)
arms = numeric(R)

for(i in 1:R){
  result = CBT(n = 10000, prior = "Sine")
  cum_regret[i] = result$regret
  arms[i] = result$K
}

mean(cum_regret)
sd(cum_regret)/sqrt(R)
mean(arms)
sd(arms)/sqrt(R)




