library(patchPlot)


### Name: checkGmm
### Title: checkGmm
### Aliases: checkGmm

### ** Examples

# set a gaussian mixture model 
gaussmod <- list()
gaussmod$w <- c(0.5, 0.5)
gaussmod$mean <- list(c(-3,0), c(3,0))
gaussmod$cov <- list(diag(2), diag(2))

checkGmm(gaussmod)



