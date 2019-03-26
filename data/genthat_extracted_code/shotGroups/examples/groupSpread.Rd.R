library(shotGroups)


### Name: groupSpread
### Title: Precision: Spread measures of a single group of bullet holes
### Aliases: groupSpread groupSpread.data.frame groupSpread.default

### ** Examples

# coordinates given by a suitable data frame
res <- groupSpread(DFtalon, CEPtype=c('Grubbs', 'Rayleigh'), CEPlevel=0.5,
                   CIlevel=0.95, bootCI='none', dstTarget=10, conversion='m2mm')
names(res)
res$sdXYrob
res$distToCtr
res$maxPairDist
res$CEP

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(200, 0, 5), 2), ncol=2)
##D groupSpread(xy, CEPlevel=0.5, CIlevel=0.95, dstTarget=25, conversion='m2cm')
## End(Not run)



