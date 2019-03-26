library(braidrm)


### Name: evalHillEqn
### Title: Calculate and Invert Hill Equation
### Aliases: evalHillEqn invertHillEqn
### Keywords: regression

### ** Examples

act <- evalHillEqn(exp(seq(log(10^-8),log(10^-5),length=100)),parv=c(2,0,100,log(10^-6)))
ec90 <- invertHillEqn(90,parv=c(2,0,100,log(10^-6)))



