library(survRM2)


### Name: survRM2-package
### Title: Comparing Restricted Mean Survival Time
### Aliases: survRM2-package
### Keywords: survival

### ** Examples

#--- sample data ---#
D=rmst2.sample.data()
time=D$time
status=D$status
arm=D$arm
tau=NULL
x=D[,c(4,6,7)]
#--- without covariates ----
a=rmst2(time, status, arm, tau=10)
print(a)
plot(a, xlab="Years", ylab="Probability", density=60)
#--- with covariates ----
a=rmst2(time, status, arm, tau=10, covariates=x)
print(a)



