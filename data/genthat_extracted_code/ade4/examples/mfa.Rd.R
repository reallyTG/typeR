library(ade4)


### Name: mfa
### Title: Multiple Factorial Analysis
### Aliases: mfa print.mfa plot.mfa summary.mfa
### Keywords: multivariate

### ** Examples

data(friday87)
w1 <- data.frame(scale(friday87$fau, scal = FALSE))
w2 <- ktab.data.frame(w1, friday87$fau.blo, 
    tabnames = friday87$tab.names)
mfa1 <- mfa(w2, scann = FALSE)
mfa1
plot(mfa1)

data(escopage)
w <- data.frame(scale(escopage$tab))
w <- ktab.data.frame(w, escopage$blo, tabnames = escopage$tab.names)
plot(mfa(w, scann = FALSE))



