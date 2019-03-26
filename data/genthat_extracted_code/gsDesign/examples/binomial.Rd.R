library(gsDesign)


### Name: Binomial
### Title: 3.2: Testing, Confidence Intervals, Sample Size and Power for
###   Comparing Two Binomial Rates
### Aliases: testBinomial ciBinomial nBinomial simBinomial varBinomial
### Keywords: design

### ** Examples

# Compute z-test test statistic comparing 39/500 to 13/500
# use continuity correction in variance
x <- testBinomial(x1=39, x2=13, n1=500, n2=500, adj=1)
x
pnorm(x, lower.tail=FALSE)

# Compute with unadjusted variance
x0 <- testBinomial(x1=39, x2=23, n1=500, n2=500)
x0
pnorm(x0, lower.tail=FALSE)

# Perform 50k simulations to test validity of the above
# asymptotic p-values 
# (you may want to perform more to reduce standard error of estimate)
sum(as.double(x0) <= 
    simBinomial(p1=.078, p2=.078, n1=500, n2=500, nsim=10000)) / 10000
sum(as.double(x0) <= 
    simBinomial(p1=.052, p2=.052, n1=500, n2=500, nsim=10000)) / 10000

# Perform a non-inferiority test to see if p2=400 / 500 is within 5% of 
# p1=410 / 500 use a z-statistic with unadjusted variance
x <- testBinomial(x1=410, x2=400, n1=500, n2=500, delta0= -.05)
x
pnorm(x, lower.tail=FALSE)

# since chi-square tests equivalence (a 2-sided test) rather than
# non-inferiority (a 1-sided test), 
# the result is quite different
pchisq(testBinomial(x1=410, x2=400, n1=500, n2=500, delta0= -.05, 
                    chisq=1, adj=1), 1, lower.tail=FALSE)

# now simulate the z-statistic witthout continuity corrected variance
sum(qnorm(.975) <= 
    simBinomial(p1=.8, p2=.8, n1=500, n2=500, nsim=100000)) / 100000

# compute a sample size to show non-inferiority
# with 5% margin, 90% power
nBinomial(p1=.2, p2=.2, delta0=.05, alpha=.025, sided=1, beta=.1)

# assuming a slight advantage in the experimental group lowers
# sample size requirement
nBinomial(p1=.2, p2=.19, delta0=.05, alpha=.025, sided=1, beta=.1)

# compute a sample size for comparing 15% vs 10% event rates
# with 1 to 2 randomization
nBinomial(p1=.15, p2=.1, beta=.2, ratio=2, alpha=.05)

# now look at total sample size using 1-1 randomization
n <- nBinomial(p1=.15, p2=.1, beta=.2, alpha=.05)
n
# check if inputing sample size returns the desired power
nBinomial(p1=.15, p2=.1, beta=.2, alpha=.05,n=n)

# re-do with alternate output types
nBinomial(p1=.15, p2=.1, beta=.2, alpha=.05, outtype=2)
nBinomial(p1=.15, p2=.1, beta=.2, alpha=.05, outtype=3)


# look at power plot under different control event rate and
# relative risk reductions
p1 <- seq(.075, .2, .000625)
p2 <- p1 * 2 / 3
y1 <- nBinomial(p1, p2, beta=.2, outtype=1, alpha=.025, sided=1)
p2 <- p1 * .75
y2 <- nBinomial(p1, p2, beta=.2, outtype=1, alpha=.025, sided=1)
p2 <- p1 * .6
y3 <- nBinomial(p1, p2, beta=.2, outtype=1, alpha=.025, sided=1)
p2 <- p1 * .5
y4 <- nBinomial(p1, p2, beta=.2, outtype=1, alpha=.025, sided=1)
plot(p1, y1, type="l", ylab="Sample size",
     xlab="Control group event rate", ylim=c(0, 6000), lwd=2)
title(main="Binomial sample size computation for 80 pct power")
lines(p1, y2, lty=2, lwd=2)
lines(p1, y3, lty=3, lwd=2)
lines(p1, y4, lty=4, lwd=2)
legend(x=c(.15, .2),y=c(4500, 6000),lty=c(2, 1, 3, 4), lwd=2,
       legend=c("25 pct reduction", "33 pct reduction",
                "40 pct reduction", "50 pct reduction"))

# compute blinded estimate of treatment effect difference
x1 <- rbinom(n=1,size=100,p=.2)
x2 <- rbinom(n=1,size=200,p=.1)
# blinded estimate of risk difference variance
varBinomial(x=x1+x2,n=300,ratio=2,delta0=0)
# blnded estimate of log-risk-ratio
varBinomial(x=x1+x2,n=300,ratio=2,delta0=0,scale="RR")
# blinded estimate of log-odds-ratio
varBinomial(x=x1+x2,n=300,ratio=2,delta0=0,scale="OR")




