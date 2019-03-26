library(MESS)


### Name: QIC.geeglm
### Title: Quasi Information Criterion
### Aliases: QIC.geeglm QIC QIC.geekin QIC.ordgee
### Keywords: htest

### ** Examples


library(geepack)
data(ohio)
fit <- geeglm(resp ~ age + smoke + age:smoke, id=id, data=ohio,
             family=binomial, corstr="exch", scale.fix=TRUE)
QIC(fit)




