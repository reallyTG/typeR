library(QuantPsyc)


### Name: powerF
### Title: Power in F distribution
### Aliases: powerF
### Keywords: distribution

### ** Examples


# Simulated TRA example
data(tra)
lm1 <- lm (attitudes ~ beliefs*values, tra)
summary(lm1) 
# power to detect the interaction effect, where df1 = 1 and df2 = n-k-1 = 996
# PV = t^2/(t^2+df2) = .1863
powerF(.1863, 996)

# Estimate sample size needed to detect interaction effect with PV = .01 and power = .8
powerF(.01, 200)  # too low
powerF(.01, 1000) # too high
powerF(.01, (800-3-1))  # just right: n=800 - k=3 - 1




