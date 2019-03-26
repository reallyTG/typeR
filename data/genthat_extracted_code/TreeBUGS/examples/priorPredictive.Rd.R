library(TreeBUGS)


### Name: priorPredictive
### Title: Prior Predictive Samples
### Aliases: priorPredictive

### ** Examples

eqnfile <- system.file("MPTmodels/2htm.eqn",
                       package="TreeBUGS")
### beta-MPT:
prior <- list(alpha="dgamma(1,.1)",
              beta="dgamma(1,.1)")

### prior-predictive frequencies:
priorPredictive(prior, eqnfile,
                restrictions=list("g=.5","Do=Dn"),
                numItems=c(50,50), N=10, M=1, nCPU=1)

### prior samples of group-level parameters:
priorPredictive(prior, eqnfile, level = "parameter",
                restrictions=list("g=.5","Do=Dn"),
                M=5, nCPU=1)

### latent-trait MPT
priorPredictive(prior=list(mu="dnorm(0,1)", xi="dunif(0,10)",
                           df=3, V=diag(2)),
                eqnfile, restrictions=list("g=.5"),
                numItems=c(50,50), N=10, M=1, nCPU=1)




