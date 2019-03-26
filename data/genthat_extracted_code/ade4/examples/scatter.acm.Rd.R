library(ade4)


### Name: scatter.acm
### Title: Plot of the factorial maps in a Multiple Correspondence Analysis
### Aliases: scatter.acm
### Keywords: multivariate hplot

### ** Examples

data(lascaux)
if(adegraphicsLoaded()) {
  plot(dudi.acm(lascaux$ornem, sca = FALSE))
} else {
  scatter(dudi.acm(lascaux$ornem, sca = FALSE), csub = 3)
}



