library(spdep)


### Name: bptest.sarlm
### Title: Breusch-Pagan test for spatial models
### Aliases: bptest.sarlm
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus)
error.col <- errorsarlm(CRIME ~ HOVAL + INC, data=columbus,
 nb2listw(col.gal.nb))
bptest.sarlm(error.col)
bptest.sarlm(error.col, studentize=FALSE)
## Not run: 
##D lm.target <- lm(error.col$tary ~ error.col$tarX - 1)
##D if (require(lmtest) && require(sandwich)) {
##D   coeftest(lm.target, vcov=vcovHC(lm.target, type="HC0"), df=Inf)
##D }
## End(Not run)
}



