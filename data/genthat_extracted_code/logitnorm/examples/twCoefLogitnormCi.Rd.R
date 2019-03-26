library(logitnorm)


### Name: twCoefLogitnormCi
### Title: twCoefLogitnormCi
### Aliases: twCoefLogitnormCi

### ** Examples

mu = 2
sd = c(1,0.8)
p = 0.99
lower <- l <- qlogitnorm(1-p, mu, sd )		# p-confidence interval
upper <- u <- qlogitnorm(p, mu, sd )		# p-confidence interval
cf <- twCoefLogitnormCi(lower,upper)	
all.equal( cf[,"mu"] , c(mu,mu) )
all.equal( cf[,"sigma"] , sd )



