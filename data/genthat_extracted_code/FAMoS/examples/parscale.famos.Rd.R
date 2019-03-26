library(FAMoS)


### Name: parscale.famos
### Title: Control Function for Optim
### Aliases: parscale.famos

### ** Examples

test.func<-function(x){
print(x)
3*x[1]+4*x[2]
}

pars <- c(1, 1000, 10)
scaling <- c(0.1, 3000, 10)

p.scale <- parscale.famos(par = pars, scale = scaling)

optim(par = pars, fn = test.func, control = list(maxit = 10, parscale = p.scale, trace = TRUE))




