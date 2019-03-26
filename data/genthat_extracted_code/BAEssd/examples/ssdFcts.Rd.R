library(BAEssd)


### Name: ssdFcts
### Title: Sample Size Calculations via Bayesian Average Errors
### Aliases: ssdFcts ssd ssd.binom ssd.norm1KV ssd.norm1KV.2sided
###   ssd.norm2KV.2sided ssd.norm1UV.2sided print.BAEssd

### ** Examples

############################################################
# Computing a sample size for a one-sample binomial
# experiment with a two-sided alternative.

# load suite of functions
f1 <- binom1.2sided(p0=0.5,prob=0.5,a=1,b=1)

# calculate sample size for total error bound of 0.25 and weight 0.5
attach(f1)
ss1 <- ssd.binom(alpha=0.25,w=0.5,logm=logm,two.sample=FALSE)
detach(f1)

# see results
ss1

# examine structure
str(ss1)


############################################################
# Computing a sample size for a one-sample normal
# experiment with a two-sided alternative using the
# functions internal to the suite.

# load suite of functions
f2 <- norm1KV.2sided(sigma=5,theta0=0,prob=0.5,mu=2,tau=1)

# calculate sample size for total error bound of 0.25 and weight 0.5
attach(f2)
ss2 <- ssd.norm1KV.2sided(alpha=0.25,w=0.5)
detach(f2)

# see results
ss2



