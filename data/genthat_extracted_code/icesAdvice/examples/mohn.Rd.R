library(icesAdvice)


### Name: mohn
### Title: Mohn's Rho
### Aliases: mohn

### ** Examples

mohn(shake)
mohn(shake, details=TRUE)
mohn(shake, plot=TRUE)

mohn(shake, peels=3, plot=TRUE, col="black", ylim=0:1, yaxs="i")
lines(as.numeric(rownames(shake)), shake$base, lwd=3)




