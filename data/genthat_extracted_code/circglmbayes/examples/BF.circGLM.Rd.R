library(circglmbayes)


### Name: BF.circGLM
### Title: Obtain Bayes Factors or posterior odds from circGLM objects
### Aliases: BF.circGLM

### ** Examples

dat <- generateCircGLMData(truebeta = c(0, .2), truedelta = c(.4, .01))
m   <- circGLM(th ~ ., dat)
BF.circGLM(m)

dat <- generateCircGLMData(nconpred = 0)
m   <- circGLM(th ~ ., dat)
BF.circGLM(m)

dat <- generateCircGLMData(ncatpred = 0)
m   <- circGLM(th ~ ., dat)
BF.circGLM(m)




