library(codadiags)


### Name: add.transient
### Title: Add a transient to a given mcmc sequence
### Aliases: add.transient

### ** Examples

require(codadiags)
x = AR1()
plot(x,type='l',col=rgb(.5,0,0,.5))
y = add.transient(x)
lines(y,col=rgb(0,0,0.5,.5))
transient.test(x)
transient.test(y)



