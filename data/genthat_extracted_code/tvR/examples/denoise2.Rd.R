library(tvR)


### Name: denoise2
### Title: Total Variation Denoising for Image
### Aliases: denoise2

### ** Examples

## Not run: 
##D ## Load grey-scale 'lena' data
##D data(lena128)
##D 
##D ## Add white noise
##D sinfo   <- dim(lena128)   # get the size information
##D xnoised <- lena128 + array(rnorm(sinfo, sd=10), sinfo)
##D 
##D ## apply denoising models
##D xproc1 <- denoise2(xnoised, lambda=10, method="TVL2.FiniteDifference")
##D xproc2 <- denoise2(xnoised, lambda=10, method="TVL1.PrimalDual")
##D 
##D ## compare
##D par(mfrow=c(2,2), pty="s")
##D image(lena128, main="original")
##D image(xnoised, main="noised")
##D image(xproc1, main="TVL2.FiniteDifference")
##D image(xproc2, main="TVL1.PrimalDual")
## End(Not run)




