library(circglmbayes)


### Name: mcmc_summary.circGLM
### Title: Obtain different central tendencies and CIs from a circGLM
###   object
### Aliases: mcmc_summary.circGLM

### ** Examples

dat <- generateCircGLMData()
m   <- circGLM(th ~ ., dat)
mcmc_summary.circGLM(m)




