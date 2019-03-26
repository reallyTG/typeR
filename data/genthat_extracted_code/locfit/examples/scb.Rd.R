library(locfit)


### Name: scb
### Title: Simultaneous Confidence Bands
### Aliases: scb
### Keywords: smooth

### ** Examples

# corrected confidence bands for a linear logistic model
data(insect)
fit <- scb(deaths~lp(lconc,deg=1), type=4, w=nins,
           data=insect,family="binomial",kern="parm")
plot(fit)



