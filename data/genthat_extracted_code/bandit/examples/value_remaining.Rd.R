library(bandit)


### Name: value_remaining
### Title: value_remaining
### Aliases: value_remaining

### ** Examples


x=c(10,20,30,80)
n=c(100,102,120,240)
vr = value_remaining(x, n)
hist(vr)
best_arm = which.max(best_binomial_bandit(x, n))
# "potential value" remaining in the experiment
potential_value = quantile(vr, 0.95)
paste("Were still unsure about the CvR for the best arm (arm ", best_arm,
	"), but whatever it is, one of the other arms might beat it by as much as ",
	round(potential_value*100, 4), " percent.", sep="")



