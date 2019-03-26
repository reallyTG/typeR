library(GAD)


### Name: C.test
### Title: Cochran's C test of homogeneity of variances
### Aliases: C.test
### Keywords: htest

### ** Examples

  library(GAD)
  data(rohlf95)
  cg <- as.fixed(rohlf95$cages)
  mq <- as.random(rohlf95$mosquito) 
  model <- lm(wing ~ cg + mq%in%cg, data = rohlf95)
  C.test(model)



