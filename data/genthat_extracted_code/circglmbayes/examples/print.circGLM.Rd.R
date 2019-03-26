library(circglmbayes)


### Name: print.circGLM
### Title: Print circGLM Object
### Aliases: print.circGLM

### ** Examples

print(circGLM(th = rvmc(10, 1, 1)))

dat <- generateCircGLMData()
cglmmod <- circGLM(th ~ ., dat)

print(cglmmod)

print(cglmmod, type = "mcmc")

print(cglmmod, type = "all")

print(cglmmod, type = "coef")




