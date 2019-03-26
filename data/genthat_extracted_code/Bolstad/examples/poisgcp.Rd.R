library(Bolstad)


### Name: poisgcp
### Title: Poisson sampling with a general continuous prior
### Aliases: poisgcp
### Keywords: misc

### ** Examples


## Our data is random sample is 3, 4, 3, 0, 1. We will try a normal
## prior with a mean of 2 and a standard deviation of 0.5.
y = c(3,4,3,0,1)
poisgcp(y, density = "normal", params = c(2,0.5))

## The same data as above, but with a gamma(6,8) prior
y = c(3,4,3,0,1)
poisgcp(y, density = "gamma", params = c(6,8))

## The same data as above, but a user specified continuous prior.
## We will use print.sum.stat to get a 99% credible interval for mu.
y = c(3,4,3,0,1)
mu = seq(0,8,by=0.001)
mu.prior = c(seq(0,2,by=0.001),rep(2,1999),seq(2,0,by=-0.0005))/10
poisgcp(y,"user",mu=mu,mu.prior=mu.prior,print.sum.stat=TRUE,alpha=0.01)

## find the posterior CDF using the results from the previous example
## and Simpson's rule. Note that the syntax of sintegral has changed.
results = poisgcp(y,"user",mu=mu,mu.prior=mu.prior)
cdf = sintegral(mu,results$posterior,n.pts=length(mu))$cdf
plot(cdf,type="l",xlab=expression(mu[0])
	,ylab=expression(Pr(mu<=mu[0])))

## use the cdf to find the 95% credible region.
lcb = cdf$x[with(cdf,which.max(x[y<=0.025]))]
ucb = cdf$x[with(cdf,which.max(x[y<=0.975]))]
cat(paste("Approximate 95% credible interval : ["
	,round(lcb,4)," ",round(ucb,4),"]\n",sep=""))

## find the posterior mean, variance and std. deviation
## using Simpson's rule and the output from the previous example
dens = mu*results$posterior # calculate mu*f(mu | x, n)
post.mean = sintegral(mu,dens)$value

dens = (mu-post.mean)^2*results$posterior
post.var = sintegral(mu,dens)$value
post.sd = sqrt(post.var)

# calculate an approximate 95% credible region using the posterior mean and
# std. deviation
lb = post.mean-qnorm(0.975)*post.sd
ub = post.mean+qnorm(0.975)*post.sd

cat(paste("Approximate 95% credible interval : ["
	,round(lb,4)," ",round(ub,4),"]\n",sep=""))

# NOTE: All the examples given above can now be done trivially in this package

## find the posterior CDF using the results from the previous example
results = poisgcp(y,"user",mu=mu,mu.prior=mu.prior)
cdf = cdf(results)
curve(cdf,type="l",xlab=expression(mu[0])
	,ylab=expression(Pr(mu<=mu[0])))

## use the quantile function to find the 95% credible region.
ci = quantile(results, c(0.025, 0.975))
cat(paste0("Approximate 95% credible interval : ["
	,round(ci[1],4)," ",round(ci[2],4),"]\n"))

## find the posterior mean, variance and std. deviation
## using the output from the previous example
post.mean = mean(results)

post.var = var(results)
post.sd = sd(results)

# calculate an approximate 95% credible region using the posterior mean and
# std. deviation
ci = post.mean + c(-1, 1) * qnorm(0.975) * post.sd

cat(paste("Approximate 95% credible interval : ["
	,round(ci[1],4)," ",round(ci[2],4),"]\n",sep=""))

## Example 10.1 Dianna's prior
# Firstly we need to write a function that replicates Diana's prior
f = function(mu){
   result = rep(0, length(mu))
   result[mu >=0 & mu <=2] = mu[mu >=0 & mu <=2]
   result[mu >=2 & mu <=4] = 2
   result[mu >=4 & mu <=8] = 4 - 0.5 * mu[mu >=4 & mu <=8]
   
   ## we don't need to scale so the prior integrates to one, 
   ## but it makes the results nicer to see
   
   A = 2 + 4 + 4
   result = result / A
   
   return(result)
 }
 
 results = poisgcp(y, mu = c(0, 10), mu.prior = f)




