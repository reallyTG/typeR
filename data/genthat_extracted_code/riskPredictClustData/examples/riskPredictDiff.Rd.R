library(riskPredictClustData)


### Name: riskPredictDiff
### Title: Difference of two risk prediction rules for clustered data
### Aliases: riskPredictDiff
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

# prediction rule 1
tt1 = getScore(fmla = prog~smkcur+lncalorc+inieye3+inieye4+factor(rtotfat), 
  cidVar = "cid", subuidVar = "subuid", statusVar = "prog", 
  datFrame = datFrame, mycorstr = "exchangeable",
  verbose = FALSE)
myframe1=tt1$frame

print(dim(myframe1))
print(myframe1[1:3,])

####
# prediction rule 2
tt2 = getScore(fmla = prog~smkcur+lncalorc+inieye3+inieye4, 
  cidVar = "cid", subuidVar = "subuid", statusVar = "prog", 
  datFrame = datFrame, mycorstr = "exchangeable",
  verbose = FALSE)
myframe2=tt2$frame

print(dim(myframe2))
print(myframe2[1:3,])

# combine scores from two prediction rules
myframe12=myframe1[, c("cid", "subuid", "status")]
myframe12$score1=myframe1$score
myframe12$score2=myframe2$score
print(dim(myframe12))
print(myframe12[1:3,])

####
resDiff = riskPredictDiff(frame=myframe12)
print(names(resDiff))
print(resDiff)






