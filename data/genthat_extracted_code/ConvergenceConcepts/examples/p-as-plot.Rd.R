library(ConvergenceConcepts)


### Name: p.as.plot
### Title: Interactive plot for convergence in probability and almost
###   surely
### Aliases: p.as.plot
### Keywords: dplot iplot distribution htest

### ** Examples

myrbinom <- function(n,alpha){rbinom(n,1,1/(1:n))*((1:n)**alpha)}
data <- generate(randomgen=myrbinom,nmax=1000,M=500,argsgen=list(alpha=0.5))$data
critp <- criterion(data,epsilon=0.05,"p")$crit
critas <- criterion(data,epsilon=0.05,"as")$crit
p.as.plot(data,critp,critas,epsilon=0.05,nb.sp=10,mode="p")



