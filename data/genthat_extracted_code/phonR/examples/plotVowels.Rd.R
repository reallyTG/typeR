library(phonR)


### Name: Plot vowel formant frequencies
### Title: Plot vowel formant data and a variety of derivative measures.
### Aliases: plotVowels
### Keywords: device hplot

### ** Examples

data(indoVowels)
with(indo, plotVowels(f1, f2, vowel, group=gender, plot.means=TRUE,
                      pch.means=vowel, ellipse.line=TRUE, poly.line=TRUE,
                      poly.order=c('i','e','a','o','u'), var.col.by=vowel,
                      var.sty.by=gender, pretty=TRUE, alpha.tokens=0.3,
                      cex.means=2))
# simulate some diphthongs
f1delta <- sample(c(-10:-5, 5:15), nrow(indo), replace=TRUE)
f2delta <- sample(c(-15:-10, 20:30), nrow(indo), replace=TRUE)
f1coefs <- matrix(sample(c(2:5), nrow(indo) * 2, replace=TRUE), 
                  nrow=nrow(indo))
f2coefs <- matrix(sample(c(3:6), nrow(indo) * 2, replace=TRUE),
                  nrow=nrow(indo))
indo <- within(indo, {
    f1a <- f1  + f1delta * f1coefs[,1]
    f2a <- f2  + f2delta * f2coefs[,1]
    f1b <- f1a + f1delta * f1coefs[,2]
    f2b <- f2a + f2delta * f2coefs[,2]
    })
with(indo, plotVowels(cbind(f1, f1a, f1b), cbind(f2, f2a, f2b), vowel,
                      group=gender, plot.tokens=TRUE, pch.tokens=NA,
                      alpha.tokens=0.3, plot.means=TRUE, pch.means=vowel,
                      var.col.by=vowel, var.sty.by=gender, pretty=TRUE,
                      diph.arrows=TRUE, diph.args.tokens=list(lwd=0.8),
                      diph.args.means=list(lwd=2)))



