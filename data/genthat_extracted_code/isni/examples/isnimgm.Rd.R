library(isni)


### Name: isnimgm
### Title: Function for ISNI computation when the outcome follows marginal
###   multivariate Gaussian Models.
### Aliases: isnimgm

### ** Examples

models= y | g+gp ~   perf + sever+ as.factor(time) + group +as.factor(time):group   |
       as.factor(time) * group + yp+ perf + sever
qolef.isni=isnimgm(models, data=qolef, id=id)
summary(qolef.isni)





