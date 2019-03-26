library(pomp)


### Name: rw2
### Title: Two-dimensional random-walk process
### Aliases: rw2
### Keywords: datasets models

### ** Examples

pompExample(rw2)
plot(rw2)
x <- simulate(rw2,nsim=10,seed=20348585L,params=c(x1.0=0,x2.0=0,s1=1,s2=3,tau=1))
plot(x[[1]])



