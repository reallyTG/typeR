library(jvnVaR)


### Name: jTestVaR
### Title: VaR Back-testing
### Aliases: jTestVaR
### Keywords: jVaR jPrice jReturn

### ** Examples

y <- c(11, 12, 10, 13, 12, 14, 13, 15, 13, 14, 12)
s <- jReturn(y)
alpha <- 0.2
h <- 0
v <- jVaR('non_adjust_hist',s,alpha,h)
jTestVaR(s, v, alpha, 0.05, 'p_value')



