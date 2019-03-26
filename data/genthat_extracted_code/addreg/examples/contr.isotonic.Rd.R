library(addreg)


### Name: contr.isotonic
### Title: Contrast Matrix for Isotonic Covariate
### Aliases: contr.isotonic contr.opisotonic
### Keywords: design

### ** Examples

contr.isotonic(4,1:4)
contr.isotonic(4,c(1,3,2,4))

# Show how contr.isotonic applies within model.matrix
x <- factor(round(runif(20,0,2)))
mf <- model.frame(~x)
contrasts(x) <- contr.isotonic(levels(x), levels(x))
model.matrix(mf)



