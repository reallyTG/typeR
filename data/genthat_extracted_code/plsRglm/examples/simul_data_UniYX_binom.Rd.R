library(plsRglm)


### Name: simul_data_UniYX_binom
### Title: Data generating function for univariate binomial plsR models
### Aliases: simul_data_UniYX_binom
### Keywords: datagen utilities

### ** Examples

## No test: 
layout(matrix(1:6,nrow=2))
# logit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4)))[,1])
# probit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="probit")))[,1])
# cloglog link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="cloglog")))[,1])
# cauchit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="cauchit")))[,1])
# loglog link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="loglog")))[,1])
# log link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="log")))[,1])
layout(1)


layout(matrix(1:6,nrow=2))
# logit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,offset=5)))[,1])
# probit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="probit",offset=5)))[,1])
# cloglog link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="cloglog",offset=5)))[,1])
# cauchit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="cauchit",offset=5)))[,1])
# loglog link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="loglog",offset=5)))[,1])
# log link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="log",offset=5)))[,1])
layout(1)


layout(matrix(1:6,nrow=2))
# logit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,offset=-5)))[,1])
# probit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="probit",offset=-5)))[,1])
# cloglog link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="cloglog",offset=-5)))[,1])
# cauchit link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="cauchit",offset=-5)))[,1])
# loglog link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="loglog",offset=-5)))[,1])
# log link
hist(t(replicate(100,simul_data_UniYX_binom(4,4,link="log",offset=-5)))[,1])
layout(1)
## End(No test)



