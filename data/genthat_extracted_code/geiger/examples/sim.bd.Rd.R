library(geiger)


### Name: sim.bd
### Title: birth-death population simulator
### Aliases: sim.bd
### Keywords: arith

### ** Examples


pop1 <- sim.bd(b=0.1, d=0, n0=10, times=1:10)
pop2 <- sim.bd(b=0, d=0.1, n0=10, times=1:10)
pop3 <- sim.bd(b=0.1, d=0.1, n0=10, times=1:10)

plot(pop1, type="l", ylim=c(0,max(c(pop1[,"n"], pop2[,"n"], pop3[,"n"]))))
lines(pop2, col="red")
lines(pop3, col="blue")




