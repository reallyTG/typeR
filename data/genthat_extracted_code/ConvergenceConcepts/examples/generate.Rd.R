library(ConvergenceConcepts)


### Name: generate
### Title: Generation of sample paths
### Aliases: generate
### Keywords: distribution

### ** Examples

myrbinom<-function(n,alpha){rbinom(n,1,1/(1:n))*((1:n)**alpha)}
data <- generate(randomgen=myrbinom,argsgen=list(alpha=0.5))$data



