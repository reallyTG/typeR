library(optiSel)


### Name: sim2dis
### Title: Converts a Similarity Matrix into a Dissimilarity Matrix
### Aliases: sim2dis

### ** Examples

data(map)
dir   <- system.file("extdata", package = "optiSel")
files <- file.path(dir, paste("Chr", unique(map$Chr), ".phased", sep=""))
f     <- segIBD(files, map, minSNP=15, minL=1.0)
D     <- sim2dis(f, 4)

## Multidimensional scaling of animals:
## Not run: 
##D data(Cattle)
##D library("smacof")
##D color <- c(Angler="red", Rotbunt="green", Fleckvieh="blue", Holstein="black")
##D col   <- color[as.character(Cattle$Breed)]
##D Res   <- smacofSym(D, itmax = 5000, eps = 1e-08)
##D plot(Res$conf, pch=18, col=col, main="Multidimensional Scaling", cex=0.5)
##D mtext(paste("segIBD Stress1 = ", round(Res$stress,3)))
## End(Not run)





