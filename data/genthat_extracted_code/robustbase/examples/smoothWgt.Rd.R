library(robustbase)


### Name: smoothWgt
### Title: Smooth Weighting Function - Generalized Biweight
### Aliases: smoothWgt
### Keywords: arith robust

### ** Examples

## a somewhat typical picture:
curve(smoothWgt(x, c=3, h=1), -5,7, n = 1000)

csW <- curve(smoothWgt(x, c=1/2, h=1), -2,2) # cutoff 1/2, bandwidth 1
## Show that the above is the same as
## Tukey's "biweight" or "bi-square" weight function:
bw <- function(x) pmax(0, (1 - x^2))^2
cbw <- curve(bw,                     col=adjustcolor(2, 1/2), lwd=2, add=TRUE)
cMw <- curve(Mwgt(x,c=1,"biweight"), col=adjustcolor(3, 1/2), lwd=2, add=TRUE)
stopifnot(## proving they are all the same:
   all.equal(csW, cbw, tol=1e-15),
   all.equal(csW, cMw, tol=1e-15))



