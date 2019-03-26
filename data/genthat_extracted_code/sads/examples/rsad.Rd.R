library(sads)


### Name: rsad
### Title: Sampling from a species abundance distribution
### Aliases: rsad

### ** Examples

##A Poisson sample from a community with a lognormal sad
samp2 <- rsad(S = 100, frac=0.1, sad="lnorm", coef=list(meanlog=5, sdlog=2))
## Preston plot
plot(octav(samp2))
## Once this is a Poisson sample of a lognormal community, the abundances
## in the sample should follow a Poisson-lognormal distribution.
## Adds line of theoretical Poisson-lognormal with
## mu=meanlog+log(frac) and sigma=sdlog)
## Predicted by the theoretical Poisson-lognormal truncated at zero
samp2.pred <- octavpred(samp2, sad="poilog", coef= list(mu=5+log(0.1), sig=2), trunc=0)
## Adding the line in the Preston plot
lines(samp2.pred)



