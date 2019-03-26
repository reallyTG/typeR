library(pomp)


### Name: eulermultinom
### Title: The Euler-multinomial distributions and Gamma white-noise
###   processes
### Aliases: eulermultinom reulermultinom deulermultinom rgammawn
### Keywords: distribution

### ** Examples

print(dn <- reulermultinom(5,size=100,rate=c(a=1,b=2,c=3),dt=0.1))
deulermultinom(x=dn,size=100,rate=c(1,2,3),dt=0.1)
## an Euler-multinomial with overdispersed transitions:
dt <- 0.1
dW <- rgammawn(sigma=0.1,dt=dt)
print(dn <- reulermultinom(5,size=100,rate=c(a=1,b=2,c=3),dt=dW))



