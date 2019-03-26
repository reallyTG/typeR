library(GMCM)


### Name: rtheta
### Title: Get random parameters for the Gaussian mixture (copula) model
### Aliases: rtheta

### ** Examples

rtheta()

rtheta(d = 5, m = 2)

rtheta(d = 3, m = 2, method = "EqualEllipsoidal")

test <- rtheta()
is.theta(test)

summary(test)
print(test)
plot(test)

## Not run: 
##D A <- SimulateGMMData(n = 100, rtheta(d = 2, method = "EqualSpherical"))
##D plot(A$z, col = A$K, pch = A$K, asp = 1)
##D B <- SimulateGMMData(n = 100, rtheta(d = 2, method = "UnequalSpherical"))
##D plot(B$z, col = B$K, pch = B$K, asp = 1)
##D C <- SimulateGMMData(n = 100, rtheta(d = 2, method = "EqualEllipsoidal"))
##D plot(C$z, col = C$K, pch = C$K, asp = 1)
##D D <- SimulateGMMData(n = 100, rtheta(d = 2, method = "UnequalEllipsoidal"))
##D plot(D$z, col = D$K, pch = D$K, asp = 1)
## End(Not run)



