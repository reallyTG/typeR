library(tawny)


### Name: denoise
### Title: Remove noise from a correlation matrix using RMT to identify the
###   noise
### Aliases: denoise cor.clean cor.empirical normalize deform Denoiser
###   EmpiricalDenoiser SampleDenoiser RandomMatrixDenoiser
###   ShrinkageDenoiser
### Keywords: ts

### ** Examples

## Not run: 
##D data(sp500.subset)
##D 
##D h <- sp500.subset
##D p <- TawnyPortfolio(h, 150)
##D r1 <- denoise(p, SampleDenoiser())
##D r2 <- denoise(p, EmpiricalDenoiser())
##D r3 <- denoise(p, ShrinkageDenoiser())
##D r4 <- denoise(p, RandomMatrixDenoiser())
## End(Not run)



