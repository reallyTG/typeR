library(glmmBUGS)


### Name: binToBinom
### Title: Convert Bernoulli observations to Binomial
### Aliases: binToBinom

### ** Examples

  thedata = data.frame(sex = rep(c("m", "f"), 10), age=rep(c(20,30), c(10, 10)))
  y = rbinom(dim(thedata)[1], 1, 0.5)
  bindata = binToBinom(y, thedata)
  bindata$zeros = bindata$N - bindata$y
  glm(as.matrix(bindata[,c("y", "zeros")]) ~ sex, data=bindata, family=binomial)



