library(shotGroups)


### Name: groupShape
### Title: Shape analysis for a single group of bullet holes
### Aliases: groupShape groupShape.data.frame groupShape.default

### ** Examples

# coordinates given by a suitable data frame
res <- groupShape(DFsavage, bandW=4, outlier='mcd',
                  dstTarget=100, conversion='m2mm')
names(res)
res$corXY
res$Outliers
res$multNorm

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(200, 0, 5), 2), ncol=2)
##D groupShape(xy, bandW=1.6)
## End(Not run)



