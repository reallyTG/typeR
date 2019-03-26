library(circglmbayes)


### Name: predict.circGLM
### Title: Obtain predictions for the circGLM model
### Aliases: predict.circGLM

### ** Examples

dat <- generateCircGLMData()
m   <- circGLM(th ~ ., dat)

# Predictions for the original outcome angles.
predict(m)

# Predictions for new data
dat2  <- generateCircGLMData()
predict(m, newdata = dat2)



