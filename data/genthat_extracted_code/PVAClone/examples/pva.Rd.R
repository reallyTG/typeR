library(PVAClone)


### Name: pva
### Title: Population Viability Analysis
### Aliases: pva diagn_scale
### Keywords: htest models ts

### ** Examples

## Not run: 
##D data(redstart)
##D data(paurelia)
##D data(songsparrow)
##D 
##D ## Gompertz
##D m1 <- pva(redstart, "gompertz", c(5,10))
##D m2 <- pva(redstart, gompertz("poisson"), c(5,10))
##D m3 <- pva(redstart, gompertz("normal"), c(5,10))
##D m1na <- pva(paurelia, "gompertz", c(5,10))
##D m2na <- pva(paurelia, gompertz("poisson"), c(5,10))
##D m3na <- pva(paurelia, gompertz("normal"), c(5,10))
##D m1x <- pva(redstart, gompertz("normal"), 5)
##D m2x <- pva(redstart, gompertz("normal", fixed=c(tau=0.1)), 5)
##D 
##D ## Ricker
##D m1 <- pva(redstart, "ricker", c(5,10))
##D m2 <- pva(redstart, ricker("poisson"), c(5,10))
##D m3 <- pva(redstart, ricker("normal"), c(5,10))
##D m1na <- pva(paurelia, "ricker", c(5,10))
##D m2na <- pva(paurelia, ricker("poisson"), c(5,10))
##D m3na <- pva(paurelia, ricker("normal"), c(5,10))
##D m1x <- pva(redstart, ricker("normal"), 5)
##D m2x <- pva(redstart, ricker("normal", fixed=c(tau=0.1)), 5)
##D 
##D ## Theta-Logistic
##D m1 <- pva(songsparrow, "thetalogistic", c(5,10))
##D m2 <- pva(songsparrow, thetalogistic("poisson"), c(2,5))
##D m3 <- pva(songsparrow, thetalogistic("normal"), c(2,5))
##D m1x <- pva(songsparrow,
##D     thetalogistic_D("normal", fixed=c(sigma2.d=0.66)), 5)
##D m2x <- pva(songsparrow,
##D     thetalogistic_D("none", fixed=c(theta=1, sigma2.d=0.66)), 10)
##D 
##D m2x
##D summary(m2x)
##D coef(m2x)
##D vcov(m2x)
##D confint(m2x)
##D plot(m2x)
##D plot(diagn_scale(m2x))
## End(Not run)



