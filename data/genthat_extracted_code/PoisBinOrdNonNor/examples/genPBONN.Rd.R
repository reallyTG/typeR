library(PoisBinOrdNonNor)


### Name: genPBONN
### Title: Engine (generation) function for the PoisBinOrdNonNor package
### Aliases: genPBONN

### ** Examples

## Not run: 
##D cmat.star <- find.cor.mat.star(cor.mat = .8 * diag(8) + .2, no.pois = 2, no.ord = 4, 
##D     no.nonn = 2, pois.list = list(1, 2), ord.list = list(c(.2, .8), c(.5, .5),
##D     c(.1, .2, .3, .4), c(.8, 0, .1, .1)), nonn.list = list(c(-1, 1, 0, 1), c(0, 3, 0, 2)))
##D mydata <- genPBONN(1000, no.pois = 2, no.ord = 4, no.nonn = 2, 
##D     cmat.star = cmat.star, pois.list = list(1, 2), 
##D     ord.list = list(c(.2, .8), c(.5, .5),c(.1, .2, .3, .4),
##D     c(.8, 0, .1, .1)), nonn.list = list(c(-1, 1, 0, 1), c(0, 3, 0, 2)))
##D 
##D apply(mydata, 2, mean)
##D apply(mydata, 2, var)
##D library(moments)
##D apply(mydata, 2, skewness)
##D apply(mydata, 2, kurtosis) - 3
##D lapply(apply(mydata[, 1:6], 2, table), prop.table)
##D cor(mydata)
## End(Not run)



