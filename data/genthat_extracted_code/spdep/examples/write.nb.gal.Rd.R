library(spdep)


### Name: write.nb.gal
### Title: Write a neighbours list as a GAL lattice file
### Aliases: write.nb.gal
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
GALfile <- tempfile("GAL")
write.nb.gal(col.gal.nb, GALfile)
col.queen <- read.gal(GALfile)
summary(diffnb(col.queen, col.gal.nb))
}


