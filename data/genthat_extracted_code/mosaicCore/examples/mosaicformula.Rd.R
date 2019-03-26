library(mosaicCore)


### Name: mosaic_formula
### Title: Convert formulas into standard shapes
### Aliases: mosaic_formula mosaic_formula_q

### ** Examples

mosaic_formula( ~ x | z )
mosaic_formula( ~ x, groups=g )
mosaic_formula( y ~ x, groups=g )
# this is probably not what you want for interactive use.
mosaic_formula_q( y ~ x, groups=g )
# but it is for programming
foo <- function(x, groups=NULL) {
    mosaic_formula_q(x, groups=groups, envir=parent.frame())
}
foo( y ~ x , groups = g)



