library(ConvergenceConcepts)


### Name: criterion
### Title: Convergence criterion computation
### Aliases: criterion
### Keywords: distribution htest

### ** Examples

myrbinom <- function(n,alpha){rbinom(n,1,1/(1:n))*((1:n)**alpha)}
data <- generate(nmax=1000,M=500,myrbinom,args=list(alpha=0.5))$data
critr1 <- criterion(data,mode="r",r=1)$crit



