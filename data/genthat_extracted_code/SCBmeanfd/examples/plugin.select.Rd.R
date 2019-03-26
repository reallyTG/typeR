library(SCBmeanfd)


### Name: plugin.select
### Title: Plug-in Bandwidth Selection for Local Polynomial Estimation
### Aliases: plugin.select

### ** Examples

## Not run: 
##D ## Phoneme data
##D data(phoneme)
##D classes <- phoneme[,151]
##D phoneme <- phoneme[,-151]
##D freq    <- 1:150
##D plugin.bandwidth  <- numeric(5) 
##D cv.bandwidth  <- numeric(5)  # compare with cross-validation
##D for (i in 1:5) {
##D   plugin.bandwidth[i] <- plugin.select(x = freq, y = phoneme[classes == i, ],
##D                           drv = 0, degree = 1) 
##D   cv.bandwidth[i]     <- cv.select(x = freq, y = phoneme[classes == i, ], 
##D                           degree = 1)
##D }
##D 
##D round(cbind(plugin.bandwidth, cv.bandwidth), 4)
##D 
## End(Not run)



