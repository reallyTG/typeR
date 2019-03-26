library(circglmbayes)


### Name: print_mcmc.circGLM
### Title: Print the mcmc results from a circGLM object
### Aliases: print_mcmc.circGLM

### ** Examples

print(circGLM(th = rvmc(10, 1, 1)), type = "mcmc", digits = 3)

dat <- generateCircGLMData()
cglmmod <- circGLM(th = dat[, 1], X = dat[, -1])
print(cglmmod, type = "mcmc")



