library(riskPredictClustData)


### Name: genSimDataGLMEM
### Title: Generate simulated data from logistic mixed effects model based
###   on the AMD data
### Aliases: genSimDataGLMEM
### Keywords: method

### ** Examples


set.seed(1234567)
datFrame = genSimDataGLMEM(nSubj = 30, beta0 = -6, sd.beta0i = 1.58, 
                          beta1 = 1.58, beta2 = -3.95, beta3 = 3.15, beta4 = 2.06,
                          beta5 = 0.51, beta6 = 1.47, beta7 = 3.11, 
                          p.smkcur = 0.08, p.inieye31 = 0.44, p.inieye32 = 0.42,
                          p.inieye41 = 0.12, p.inieye42 = 0.11, sd.lncalorc = 0.33)
print(dim(datFrame))
print(datFrame[1:2,])



