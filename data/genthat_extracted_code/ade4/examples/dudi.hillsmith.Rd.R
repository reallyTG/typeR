library(ade4)


### Name: dudi.hillsmith
### Title: Ordination of Tables mixing quantitative variables and factors
### Aliases: dudi.hillsmith
### Keywords: multivariate

### ** Examples

data(dunedata)
attributes(dunedata$envir$use)$class <- "factor"   # use dudi.mix for ordered data
dd1 <- dudi.hillsmith(dunedata$envir, scann = FALSE)
if(adegraphicsLoaded()) {
  g <- scatter(dd1, row.plab.cex = 1, col.plab.cex = 1.5)
} else {
  scatter(dd1, clab.r = 1, clab.c = 1.5)
}


