library(jvnVaR)


### Name: jVaRLim
### Title: Value at Risk Function(under price limit condition)
### Aliases: jVaRLim
### Keywords: jVaR jPrice jReturn

### ** Examples

y <- c(11, 12, 10, 13, 12, 14, 13, 15, 13, 14, 12)
s <- jReturn(y)
alpha <- 0.2
h <- 0
L <- -0.13
U <- 0.16
v <- jVaRLim(s,L,U,alpha,'model',h)



