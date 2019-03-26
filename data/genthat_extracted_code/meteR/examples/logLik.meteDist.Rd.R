library(meteR)


### Name: logLik.meteDist
### Title: Compute log-likelihood of a meteDist object
### Aliases: logLik.meteDist

### ** Examples

data(arth)
## object holding ecosystem structure function
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
## calculate individual power distribution and its likelihood
ipd1 <- ipd(esf1)
logLik(ipd1)



