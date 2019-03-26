library(Replication)


### Name: ppc.step1
### Title: Prior predictive check step 1
### Aliases: ppc.step1
### Keywords: htest models

### ** Examples

## Don't show: 
#step 1 input
data <- data.frame(y=ChickWeight$weight,x=ChickWeight$Time)

model <- '
y ~ x     #regression
y ~1      #intercept not default in lavaan (but is in blavaan)
'

reg.step1 <- ppc.step1(y.o=data, model=model,n.r=10,nadapt=10,nburnin=10,nsample=10,nsim=10)
## End(Don't show)
## No test: 
#the following example can be used, but takes >10 seconds

#step 1 input
data <- data.frame(y=ChickWeight$weight,x=ChickWeight$Time)

model <- '
y ~ x     #regression
y ~1      #intercept not default in lavaan (but is in blavaan)
'

reg.step1 <- ppc.step1(y.o=data, model=model,n.r=50)
## End(No test)



