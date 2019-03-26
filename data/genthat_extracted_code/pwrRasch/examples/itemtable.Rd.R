library(pwrRasch)


### Name: itemtable
### Title: Summary of DIF items
### Aliases: itemtable

### ** Examples

## Not run: 
##D 
##D # item parameters
##D ipar2 <- ipar1 <- seq(-3, 3, length.out = 20)
##D # model differential item function (DIF)
##D ipar2[10] <- ipar1[11]
##D ipar2[11] <- ipar1[10]
##D # simulation for b = 100
##D simres <- pwr.rasch(100, ipar = list(ipar1, ipar2))
##D itemtable(simres)
## End(Not run)



