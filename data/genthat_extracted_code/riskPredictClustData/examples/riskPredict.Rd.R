library(riskPredictClustData)


### Name: riskPredict
### Title: Assessing risk prediction performance for clustered data
### Aliases: riskPredict
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

tt1 = getScore(fmla = prog~smkcur+lncalorc+inieye3+inieye4+factor(rtotfat), 
  cidVar = "cid", subuidVar = "subuid", statusVar = "prog", 
  datFrame = datFrame, mycorstr = "exchangeable",
  verbose = FALSE)
myframe1=tt1$frame

print(dim(myframe1))
print(myframe1[1:3,])

res1 = riskPredict(myframe1)
print(names(res1))
print(res1)





