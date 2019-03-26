library(dae)


### Name: tukey.1df
### Title: Performs Tukey's one-degree-of-freedom-test-for-nonadditivity
### Aliases: tukey.1df
### Keywords: models htest

### ** Examples

## set up data frame for randomized complete block design in Table 4.4 from 
## Box, Hunter and Hunter (2005) Statistics for Experimenters. 2nd edn 
## New York, Wiley.
RCBDPen.dat <- fac.gen(list(Blend=5, Flask=4))
RCBDPen.dat$Treat <- factor(rep(c("A","B","C","D"), times=5))
RCBDPen.dat$Yield <- c(89,88,97,94,84,77,92,79,81,87,87,
                       85,87,92,89,84,79,81,80,88)

## perform the analysis of variance
RCBDPen.aov <- aov(Yield ~ Blend + Treat + Error(Blend/Flask), RCBDPen.dat)
summary(RCBDPen.aov)

## Obtain the quantities for Tukey's test
tukey.1df(RCBDPen.aov, RCBDPen.dat, error.term = "Blend:Flask")



