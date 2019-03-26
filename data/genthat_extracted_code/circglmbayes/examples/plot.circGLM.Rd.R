library(circglmbayes)


### Name: plot.circGLM
### Title: Plot circGLM object
### Aliases: plot.circGLM

### ** Examples

plot(circGLM(th = rvmc(10, 1, 1)))

dat <- generateCircGLMData(n = 100, nconpred = 1, ncatpred = 1)
m   <- circGLM(th ~ ., dat)

# Traceplot by default
plot(m)

# Traceplot stack
plot(m, type = "tracestack")

# Prediction plot
plot(m, type = "predict")

# Mean comparisons
plot(m, type = "meancompare")
plot(m, type = "meanboxplot")




