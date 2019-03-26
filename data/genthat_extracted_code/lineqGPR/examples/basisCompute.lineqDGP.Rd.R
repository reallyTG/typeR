library(lineqGPR)


### Name: basisCompute.lineqDGP
### Title: Basis Functions for '"lineqDGP"' Models
### Aliases: basisCompute.lineqDGP

### ** Examples

x <- seq(0, 1, 0.01)
Phib <- basisCompute.lineqDGP(x, m = 5, constrType = "boundedness")
matplot(Phib, type = "l", lty = 2,
        main = "Basis functions for boundedness constraints")
Phim <- basisCompute.lineqDGP(x, m = 5, constrType = "monotonicity")
matplot(Phim, type = "l", lty = 2,
        main = "Basis functions for monotonicity constraints")
Phic <- basisCompute.lineqDGP(x, m = 5, constrType = "convexity")
matplot(Phic, type = "l", lty = 2,
        main = "Basis functions for convexity constraints")




