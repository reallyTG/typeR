library(mixdist)


### Name: pike65sg
### Title: Length-Frequency Data with Subsamples for Heming Lake Pike
### Aliases: pike65sg
### Keywords: datasets

### ** Examples

data(pike65sg)
data(pikepar)
fit1 <- mix(pike65sg, pikepar, "gamma", mixconstr(consigma = "CCV"), usecondit = TRUE)
plot(fit1)
fit2 <- mix(pike65sg, pikepar, "gamma", usecondit = TRUE)
plot(fit2)



