library(pwrRasch)


### Name: plot.pwrrasch
### Title: Plot Statistical Power Curve
### Aliases: plot.pwrrasch

### ** Examples

## Not run: 
##D 
##D # item parameters
##D ipar2 <- ipar1 <- seq(-3, 3, length.out = 20)
##D # model differential item function (DIF)
##D ipar2[10] <- ipar1[11]
##D ipar2[11] <- ipar1[10]
##D # simulation for b = 100, 200, 300, 400, 500
##D simres <- pwr.rasch(seq(100, 500, by = 100), ipar = list(ipar1, ipar2))
##D plot(simres)
## End(Not run)



