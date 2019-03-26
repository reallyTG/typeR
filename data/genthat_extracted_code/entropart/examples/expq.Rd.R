library(entropart)


### Name: expq
### Title: Exponential of order q
### Aliases: expq expq.CommunityProfile

### ** Examples

curve(exp(x), -5, 0, lty=3)  
curve(expq(x, 2), -5, 0, lty=2, add=TRUE)
curve(expq(x, 3), -5, 0, lty=1, add=TRUE)
legend("topleft", legend = c("exp(x)", "exp2(x)", "exp3(x)"), lty = c(1, 2, 3), inset=0.02)



