library(jvnVaR)


### Name: jVaR
### Title: Value at Risk Function
### Aliases: jVaR
### Keywords: jVaRLim jMCPriLim jMCPri jTestVaR

### ** Examples

y <- c(11, 12, 10, 13, 12, 14, 13, 15, 13, 14, 12)
s <- jReturn(y)
alpha <- 0.2
h <- 0
v <- jVaR('non_adjust_hist',s,alpha,h)



