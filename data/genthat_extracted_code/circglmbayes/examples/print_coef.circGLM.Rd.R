library(circglmbayes)


### Name: print_coef.circGLM
### Title: Print circGLM coefficients
### Aliases: print_coef.circGLM

### ** Examples

print(circGLM(th = rvmc(10, 0, 1)), type = "coef")

dat <- generateCircGLMData()
cglmmod <- circGLM(th = dat[, 1], X = dat[, -1])
print(cglmmod, type = "coef")



