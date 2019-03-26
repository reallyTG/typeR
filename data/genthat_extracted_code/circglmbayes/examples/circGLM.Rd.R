library(circglmbayes)


### Name: circGLM
### Title: Fitting Bayesian circular General Linear Models
### Aliases: circGLM

### ** Examples

dat <- generateCircGLMData()
m   <- circGLM(th ~ ., dat)
print(m)
print(m, type = "all")
plot(m, type = "tracestack")



