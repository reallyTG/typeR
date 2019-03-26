library(primer)


### Name: dlvcomp2
### Title: Discrete Logistic Competition
### Aliases: dlvcomp2
### Keywords: methods

### ** Examples

alphs <- matrix(c( .01, .005,
                  .008, .01), ncol=2, byrow=TRUE)
t <- 20
N <- matrix(NA, nrow=t+1, ncol=2)
N[1,] <- c(10,10)
for(i in 1:t) N[i+1,] <- dlvcomp2(N[i,], alphs)
matplot(0:t, N, type='l', col=1, ylim=c(0,110))
abline(h=1/alphs[1,1], lty=3)
text(0, 1/alphs[1,1], "K", adj=c(0,0))
legend("right", c(expression("Sp.1 "*(alpha[21]==0.008)), 
                  expression("Sp.2 "*(alpha[12]==0.005))), lty=1:2, bty='n')



