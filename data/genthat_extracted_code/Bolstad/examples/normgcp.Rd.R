library(Bolstad)


### Name: normgcp
### Title: Bayesian inference on a normal mean with a general continuous
###   prior
### Aliases: normgcp
### Keywords: misc

### ** Examples


## generate a sample of 20 observations from a N(-0.5,1) population
x = rnorm(20,-0.5,1)

## find the posterior density with a uniform U[-3,3] prior on mu
normgcp(x, 1, params = c(-3, 3))

## find the posterior density with a non-uniform prior on mu
mu = seq(-3, 3, by = 0.1)
mu.prior = rep(0, length(mu))
mu.prior[mu <= 0] = 1 / 3 + mu[mu <= 0] /9
mu.prior[mu > 0] = 1 / 3 - mu[mu > 0] / 9
normgcp(x, 1, density = "user", mu = mu, mu.prior = mu.prior)

## find the CDF for the previous example and plot it
## Note the syntax for sintegral has changed
results = normgcp(x,1,density="user",mu=mu,mu.prior=mu.prior)
cdf = sintegral(mu,results$posterior,n.pts=length(mu))$cdf
plot(cdf,type="l",xlab=expression(mu[0])
             ,ylab=expression(Pr(mu<=mu[0])))

## use the CDF for the previous example to find a 95%
## credible interval for mu. Thanks to John Wilkinson for this simplified code

lcb = cdf$x[with(cdf,which.max(x[y<=0.025]))]
ucb = cdf$x[with(cdf,which.max(x[y<=0.975]))]
cat(paste("Approximate 95% credible interval : ["
           ,round(lcb,4)," ",round(ucb,4),"]\n",sep=""))

## use the CDF from the previous example to find the posterior mean
## and std. deviation
dens = mu*results$posterior
post.mean = sintegral(mu,dens)$value

dens = (mu-post.mean)^2*results$posterior
post.var = sintegral(mu,dens)$value
post.sd = sqrt(post.var)

## use the mean and std. deviation from the previous example to find
## an approximate 95% credible interval
lb = post.mean-qnorm(0.975)*post.sd
ub = post.mean+qnorm(0.975)*post.sd


cat(paste("Approximate 95% credible interval : ["
   ,round(lb,4)," ",round(ub,4),"]\n",sep=""))

## repeat the last example but use the new summary functions for the posterior
results = normgcp(x, 1, density = "user", mu = mu, mu.prior = mu.prior)

## use the cdf function to get the cdf and plot it
postCDF = cdf(results) ## note this is a function
plot(results$mu, postCDF(results$mu), type="l", xlab = expression(mu[0]),
     ylab = expression(Pr(mu <= mu[0])))

## use the quantile function to get a 95% credible interval
ci = quantile(results, c(0.025, 0.975))
ci

## use the mean and sd functions to get the posterior mean and standard deviation
postMean = mean(results)
postSD = sd(results)
postMean
postSD

## use the mean and std. deviation from the previous example to find
## an approximate 95% credible interval
ciApprox = postMean + c(-1,1) * qnorm(0.975) * postSD
ciApprox




