library(circglmbayes)


### Name: plot_tracestack.circGLM
### Title: Plot a stack of traceplots for a circGLM object
### Aliases: plot_tracestack.circGLM

### ** Examples

plot(circGLM(th = rvmc(100, 0, 1)), type = "tracestack")

dat <- generateCircGLMData()
plot(circGLM(th ~ ., dat), type = "tracestack")




