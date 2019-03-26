library(pairwiseCI)


### Name: np.re
### Title: Nonparametric test and confidence interval based on relative
###   effects
### Aliases: np.re
### Keywords: htest

### ** Examples


data(sodium)

iso<-subset(sodium, Treatment=="xisogenic")$Sodiumcontent
tra<-subset(sodium, Treatment=="transgenic")$Sodiumcontent

np.re(x=iso, y=tra, conf.level = 0.95)
np.re(x=iso, y=tra, conf.level = 0.95, alternative="less")
np.re(x=iso, y=tra, conf.level = 0.95, alternative="greater")




