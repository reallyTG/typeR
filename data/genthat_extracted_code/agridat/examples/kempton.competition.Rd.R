library(agridat)


### Name: kempton.competition
### Title: Sugar beet trial with competition effects
### Aliases: kempton.competition

### ** Examples


data(kempton.competition)
dat <- kempton.competition

# Raw means in Kempton table 2
round(tapply(dat$yield, dat$gen, mean),2)

# Fixed genotype effects, random rep effects,
# Autocorrelation of neighboring plots within the same rep, phi = -0.22
require("nlme")
m1 <- lme(yield ~ -1+gen, random=~1|rep, data=dat,
          corr=corAR1(form=~col|rep))
# Lag 1 autocorrelation is negative--evidence of competition
plot(ACF(m1), alpha=.05, grid=TRUE, main="kempton.competition",
     ylab="Autocorrelation between neighborning plots")

# Genotype effects
round(fixef(m1),2)

# Variance of yield increases with yield
plot(m1, main="kempton.competition")




