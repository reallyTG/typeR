library(lmomco)


### Name: pdfst3
### Title: Probability Density Function of the 3-Parameter Student t
###   Distribution
### Aliases: pdfst3
### Keywords: distribution probability density function Distribution:
###   Student t (3-parameter)

### ** Examples

## Not run: 
##D xs <- -200:200
##D    para <- vec2par(c(37,25,114), type="st3")
##D plot(xs, pdfst3(xs, para), type="l")
##D    para <- vec2par(c(11,36,1000), type="st3")
##D lines(xs, pdfst3(xs, para), lty=2)
##D    para <- vec2par(c(-7,60,40), type="st3")
##D lines(xs, pdfst3(xs, para), lty=3)
## End(Not run)



