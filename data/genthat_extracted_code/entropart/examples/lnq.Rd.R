library(entropart)


### Name: lnq
### Title: Logarithm of order q
### Aliases: lnq lnq.CommunityProfile

### ** Examples

curve(log(x), 0, 1, lty=1)
curve(lnq(x, 2), 0, 1, lty=2, add=TRUE)
curve(lnq(x, 3), 0, 1, lty=3, add=TRUE)  
legend("topleft", legend = c("log(x)", "ln2(x)", "ln3(x)"), lty = c(1, 2, 3), inset=0.02)



