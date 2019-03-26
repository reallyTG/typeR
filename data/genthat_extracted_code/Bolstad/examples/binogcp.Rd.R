library(Bolstad)


### Name: binogcp
### Title: Binomial sampling with a general continuous prior
### Aliases: binogcp
### Keywords: misc

### ** Examples


## simplest call with 6 successes observed in 8 trials and a continuous
## uniform prior
binogcp(6, 8)

## 6 successes, 8 trials and a Beta(2, 2) prior
binogcp(6, 8,density = "beta", params = c(2, 2))

## 5 successes, 10 trials and a N(0.5, 0.25) prior
binogcp(5, 10, density = "normal", params = c(0.5, 0.25))

## 4 successes, 12 trials with a user specified triangular continuous prior
pi = seq(0, 1,by = 0.001)
pi.prior = rep(0, length(pi))
priorFun = createPrior(x = c(0, 0.5, 1), wt = c(0, 2, 0))
pi.prior = priorFun(pi)
results = binogcp(4, 12, "user", pi = pi, pi.prior = pi.prior)

## find the posterior CDF using the previous example and Simpson's rule
myCdf = cdf(results)
plot(myCdf, type = "l", xlab = expression(pi[0]),
	   ylab = expression(Pr(pi <= pi[0])))

## use the quantile function to find the 95% credible region.
qtls = quantile(results, probs = c(0.025, 0.975))
cat(paste("Approximate 95% credible interval : ["
	, round(qtls[1], 4), " ", round(qtls, 4), "]\n", sep = ""))

## find the posterior mean, variance and std. deviation
## using the output from the previous example
post.mean = mean(results)
post.var = var(results)
post.sd = sd(results)

# calculate an approximate 95% credible region using the posterior mean and
# std. deviation
lb = post.mean - qnorm(0.975) * post.sd
ub = post.mean + qnorm(0.975) * post.sd

cat(paste("Approximate 95% credible interval : ["
	, round(lb, 4), " ", round(ub, 4), "]\n", sep = ""))




