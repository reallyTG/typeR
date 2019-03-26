library(glrt)


### Name: gLRT
### Title: Do one of the four generalized logrank tests or a score test for
###   interval-censored data
### Aliases: gLRT

### ** Examples

data(cosmesis)
gLRT(cosmesis, method="glrt1", M=20, inf=100)
gLRT(cosmesis, method="glrt2", rho=1, inf=100)

data(diabetes)
gLRT(diabetes, method="glrt3", gamma=1)
gLRT(diabetes, method="score")

data(cmv)
cmvBlood = cmv[,c(2,3,6)]
cmvUrine = cmv[, 4:6]
gLRT(cmvBlood, method="glrt4")
gLRT(cmvUrine, method="glrt4", rho=1, gamma=1)

# 3-sample test
data(cosmesis)
cosmesis[80:94, 3] = 2
gLRT(cosmesis, k=3, method="glrt3", rho=0, gamma=0, inf=100)



