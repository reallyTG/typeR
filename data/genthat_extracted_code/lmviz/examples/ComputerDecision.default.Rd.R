library(lmviz)


### Name: ComputerDecision.default
### Title: Computer player decision
### Aliases: ComputerDecision.default

### ** Examples

x=rnorm(10)
y=x+rnorm(10,0,0.4)
fit=lm(y~x)
ComputerDecision.default(fit)

x=rnorm(30)
y=x+rt(30,2)
fit=lm(y~x)
ComputerDecision.default(fit)




