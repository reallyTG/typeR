library(logbin)


### Name: contr.isotonic.rev
### Title: Contrast Matrix for Reversed Isotonic Covariate
### Aliases: contr.isotonic.rev
### Keywords: design

### ** Examples

contr.isotonic.rev(4,1:4)
contr.isotonic.rev(4,c(1,3,2,4))

# Show how contr.isotonic.rev applies within model.matrix
x <- factor(round(runif(20,0,2)))
mf <- model.frame(~x)
contrasts(x) <- contr.isotonic.rev(levels(x), levels(x))
model.matrix(mf)



