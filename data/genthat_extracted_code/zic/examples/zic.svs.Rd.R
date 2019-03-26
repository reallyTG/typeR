library(zic)


### Name: zic.svs
### Title: SVS for Zero-Inflated Count Models
### Aliases: zic.svs

### ** Examples

## Not run: 
##D data( docvisits )
##D mdl <- docvisits ~ age + agesq + health + handicap + hdegree + married + schooling +
##D                     hhincome + children + self + civil + bluec + employed + public + addon
##D post <- zic.ssvs( mdl, docvisits,
##D                   10.0, 5.0, 5.0, 1.0e-04, 2.0, 2.0, 1.0, 1.0,
##D                   10.0, 5.0, 5.0, 1.0e-04, 2.0, 2.0,
##D                   1000, 10000, 10, 1.0, TRUE )
## End(Not run)


