library(circglmbayes)


### Name: plot_trace.circGLM
### Title: Make traceplots for circGLM
### Aliases: plot_trace.circGLM

### ** Examples

plot_trace.circGLM(circGLM(th = rvmc(10, 1, 1)))

dat <- generateCircGLMData()
plot(circGLM(th ~., dat), type = "trace")




