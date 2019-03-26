library(MortalitySmooth)


### Name: MortSmooth_tpower
### Title: Truncated p-th Power Function
### Aliases: MortSmooth_tpower
### Keywords: smooth

### ** Examples

x <- seq(0,1,length=100)
f1 <- MortSmooth_tpower(x=x, t=0.1, p=3)
f2 <- MortSmooth_tpower(x=x, t=0.2, p=3)
f3 <- MortSmooth_tpower(x=x, t=0.3, p=3)
## Truncated 3rd power functions equally-spaced
plot(x, f1, t="l",
     main="Truncated 3rd power functions equally-spaced") 
lines(x, f2, col=2)
lines(x, f3, col=3)



