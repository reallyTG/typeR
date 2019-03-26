library(VGAM)


### Name: meplot
### Title: Mean Excess Plot
### Aliases: meplot meplot.default meplot.vlm
### Keywords: models regression

### ** Examples

## Not run: 
##D meplot(with(venice90, sealevel), las = 1) -> ii
##D names(ii)
##D abline(h = ii$meanExcess[1], col = "orange", lty = "dashed")
##D 
##D par(mfrow = c(2, 2))
##D for (ii in 1:4)
##D   meplot(rgpd(1000), col = c("orange", "blue", "orange"))
## End(Not run)



