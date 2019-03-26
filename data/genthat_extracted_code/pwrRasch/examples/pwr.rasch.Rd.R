library(pwrRasch)


### Name: pwr.rasch
### Title: Simulation to Estimate Statistical Power of a Rasch Model Test
### Aliases: pwr.rasch

### ** Examples

## Not run: 
##D 
##D # item parameters
##D ipar2 <- ipar1 <- seq(-3, 3, length.out = 20)
##D # model differential item function (DIF)
##D ipar2[10] <- ipar1[11]
##D ipar2[11] <- ipar1[10]
##D # simulation for b = 200
##D pwr.rasch(200, ipar = list(ipar1, ipar2))
##D 
##D # simulation for b = 100, 200, 300, 400, 500
##D pwr.rasch(seq(100, 500, by = 100), ipar = list(ipar1, ipar2))
##D 
##D # simulation for b = 100, 200, 300, 400, 500
##D # uniform distribution [-3, 3] of person parameters
##D pwr.rasch(200, ipar = list(ipar1, ipar2), ppar = list("runif(b, -3, 3)", "runif(b, -3, 3)"))
## End(Not run)



