library(pdSpecEst)


### Name: pdCART
### Title: Tree-structured trace thresholding of wavelet coefficients
### Aliases: pdCART

### ** Examples

## 1D tree-structured trace thresholding
P <- rExamples1D(2^8, example = "bumps")$P
Coeffs <- WavTransf1D(P)
pdCART(Coeffs$D, Coeffs$D.white, order = 5)$w ## logical tree of non-zero coefficients

## Not run: 
##D ## 2D tree-structured trace thresholding
##D P <- rExamples2D(c(2^6, 2^6), 2, example = "tvar")$P
##D Coeffs <- WavTransf2D(P)
##D pdCART(Coeffs$D, Coeffs$D.white, order = c(3, 3))$w
## End(Not run)




