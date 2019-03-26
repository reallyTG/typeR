library(ade4)


### Name: kplot.mfa
### Title: Multiple Graphs for a Multiple Factorial Analysis
### Aliases: kplot.mfa
### Keywords: multivariate hplot

### ** Examples

data(friday87)
w1 <- data.frame(scale(friday87$fau, scal = FALSE))
w2 <- ktab.data.frame(w1, friday87$fau.blo, tabnames = friday87$tab.names)
mfa1 <- mfa(w2, scann = FALSE)
kplot(mfa1)



