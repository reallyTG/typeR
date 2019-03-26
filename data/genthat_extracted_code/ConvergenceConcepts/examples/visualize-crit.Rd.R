library(ConvergenceConcepts)


### Name: visualize.crit
### Title: Visualisation of convergence criterion curves
### Aliases: visualize.crit
### Keywords: dplot distribution htest

### ** Examples

myrbinom <- function(n,alpha){rbinom(n,1,1/(1:n))*((1:n)**alpha)}
data <- generate(randomgen=myrbinom,nmax=1000,M=500,argsgen=list(alpha=0.5))$data
critr1 <- criterion(data,epsilon=0.05,mode="r",r=2)$crit
visualize.crit(critr1,main="Convergence in 2-th mean?",col="red")
legend(0,5,legend=expression(hat(e)["n,2"]),lty=1,col="red")



