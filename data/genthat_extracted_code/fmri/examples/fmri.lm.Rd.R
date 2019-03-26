library(fmri)


### Name: fmri.lm
### Title: Linear Model for fMRI data
### Aliases: fmri.lm
### Keywords: regression

### ** Examples

  ## Not run: 
##D   # Example 1
##D   data <- list(ttt=writeBin(rnorm(32*32*32*107), raw(), 4),
##D                mask=array(1, c(32, 32, 32)), dim=c(32, 32, 32, 107))
##D   class(data) <- "fmridata"
##D   hrf <- fmri.stimulus(107, c(18, 48, 78), 15, 2)
##D   z <- fmri.design(hrf,2)
##D   model <- fmri.lm(data, z, verbose=TRUE)
##D   plot(extract.data(data)[16, 16, 16,])
##D   lines(extract.data(data)[16, 16, 16, ] - extract.data(model, "residuals")[16, 16, 16, ], col=2)
##D   
## End(Not run)



