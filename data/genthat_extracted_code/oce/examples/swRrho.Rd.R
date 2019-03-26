library(oce)


### Name: swRrho
### Title: Density ratio
### Aliases: swRrho

### ** Examples

library(oce)
data(ctd)
u <- swRrho(ctd, eos="unesco")
g <- swRrho(ctd, eos="gsw")
p <- ctd[["p"]]
plot(u, p, ylim=rev(range(p)), type='l', xlab=expression(R[rho]))
lines(g, p, lty=2, col='red')
legend("topright", lty=1:2, legend=c("unesco", "gsw"), col=c("black", "red"))




