library(epimdr)


### Name: llik.pc
### Title: Function to estimate parameters for the picewise-constant
###   catalytic model
### Aliases: llik.pc

### ** Examples

x=c(1,4,8,12,18,24)
para=rep(.1,length(x))
## Not run: optim(par=log(para),fn=loglikpc, age=rabbit$a, num=rabbit$inf, denom=rabbit$n, up=x)



