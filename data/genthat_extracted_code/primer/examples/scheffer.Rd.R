library(primer)


### Name: scheffer
### Title: A resource-based model of alternative stable states
### Aliases: scheffer
### Keywords: methods

### ** Examples

p <- c(N=2.5, as=0.01, af=0.01, b=0.02, qs=0.075, qf=0.005, 
       hs=0, hf=0.2, ls=0.05, lf=0.05, rs=0.5, rf=0.5, W=0)
t <- 1:200
Initial <- c(F=10, S=10)
S.out1 <- ode(Initial, t, scheffer, p)
matplot(t, S.out1[,-1], type='l')
legend('right', c("F", "S"), lty=1:2, col=1:2, bty='n')



