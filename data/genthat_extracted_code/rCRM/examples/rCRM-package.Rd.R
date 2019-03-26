library(rCRM)


### Name: rCRM-package
### Title: Regularized CRM
### Aliases: rCRM-package
### Keywords: CRM L2-norm Regularization Package

### ** Examples


set.seed(1213)

dose0=c(1:6)
prob0=c(0.007, 0.086, 0.294, 0.545, 0.731, 0.841)

m=3; Y=NULL; X=NULL
for (i in 1:length(dose0)) {
  Y=c(Y, rbinom(m, size=1, prob=prob0[i]))
  X=c(X, rep(i, m))
}

fiti=rCRM(X, Y, dose0, tp=0.3, mlambda=10)
# attributes(fiti)





