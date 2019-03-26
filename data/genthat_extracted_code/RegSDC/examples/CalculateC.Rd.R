library(RegSDC)


### Name: CalculateCdirect
### Title: Calculation of C by solving equation 10 in the paper
### Aliases: CalculateCdirect CalculateC

### ** Examples

x <- 1:10
y <- matrix(rnorm(30) + 1:30, 10, 3)
a <- residuals(lm(y ~ x))
b <- residuals(lm(2 * y + matrix(rnorm(30), 10, 3) ~ x))

a1 <- a
b1 <- b
a1[, 3] <- a[, 1] + a[, 2]
b1[, 3] <- b[, 1] + b[, 2]

alpha <- FindAlpha(a, b)
FindAlphaSimple(a, b)  # Same result as above
CalculateC(a, b)
CalculateCdirect(a, b)  # Same result as above without viaQR attribute 
CalculateCdirect(a, b, alpha = alpha/(1 + 1e-07))  # Same result as above since epsAlpha = 1e-07
CalculateCdirect(a, b, alpha = alpha/2)  # OK
# CalculateCdirect(a,b, alpha = 2*alpha) # Not OK

FindAlpha(a, b1)
# FindAlphaSimple(a,b1) # Not working since b1 is collinear
CalculateC(a, b1, returnAlpha = TRUE)  # Almost same alpha as above (epsAlpha cause difference)

FindAlpha(b, a)
CalculateC(b, a, returnAlpha = TRUE)  # 1 returned (not same as above)
CalculateC(b, a)

FindAlpha(b1, a)   # alpha smaller than epsAlpha is set to 0 in CalculateC
CalculateC(b1, a)  # When alpha = 0 C is calculated by GenQR insetad of chol



