library(zic)


### Name: zic
### Title: Bayesian Inference for Zero-Inflated Count Models
### Aliases: zic

### ** Examples

## Not run: 
##D data( docvisits )
##D mdl <- docvisits ~ age + agesq + health + handicap + hdegree + married + schooling +
##D                     hhincome + children + self + civil + bluec + employed + public + addon
##D post <- zic( f, docvisits, 10.0, 10.0, 10.0, 10.0, 1.0, 1.0, 1000, 10000, 10, 1.0, TRUE )
## End(Not run)



