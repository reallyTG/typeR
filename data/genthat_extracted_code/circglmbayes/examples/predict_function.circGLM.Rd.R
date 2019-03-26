library(circglmbayes)


### Name: predict_function.circGLM
### Title: Obtain a prediction function from a circGLM object
### Aliases: predict_function.circGLM

### ** Examples

dat <- generateCircGLMData()
m   <- circGLM(th ~ ., dat)
predfun <- predict_function.circGLM(m)
newd <- generateCircGLMData()

# Predicted values of the new data.
predfun(newd)



