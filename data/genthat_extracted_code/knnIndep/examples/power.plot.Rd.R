library(knnIndep)


### Name: power.plot
### Title: Plot power of benchmarked tests of independence
### Aliases: power.plot

### ** Examples

mycor = function(...) cor(...)^2
noises = cbind(c(.3,.4,6),c(.3,.5,4))
colnames(noises) = c("1",".2") #mutual information of the noise levels
vals = run.tests(mycor,list(),1:2,noises,100)
power.cor = drop(calculate.power(vals))
power.plot(list(cor=power.cor),t(noises))



