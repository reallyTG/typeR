library(primer)


### Name: igp
### Title: A Lotka-Volterra Model of Intraguild Predation
### Aliases: igp
### Keywords: methods

### ** Examples

library(deSolve)
params <- c(bpb= 0.032, abp=10^-8, bpn=10^-5, anp=10^-4,  mp=1,
             bnb=0.04, abn=10^-8, mn=1,
             r=1, abb=10^-9.5)
t=seq(0, 60, by=.1)
N.init <- c(B = 10^9, N = 10^4, P = 10^3)
igp.out <- ode(N.init, t, igp, params)
matplot(t, log10(igp.out[,-1]+1), type="l", 
          ylab="log(Abundance)")
legend('right', c("B", "N", "P"), lty=1:3, col=1:3, lwd=2,
       bty="n")



