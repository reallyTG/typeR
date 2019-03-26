library(Gifi)


### Name: cv.morals
### Title: Cross-validation for Morals fit
### Aliases: cv.morals cv
### Keywords: utilities

### ** Examples

## mimic linear regression
xknots <- knotsGifi(neumann[,1:2], "E")  
yknots <- knotsGifi(neumann[,3], "E")
fitlin <-  morals(neumann[,1:2], neumann[,3], xknots = xknots, yknots = yknots, 
                  xdegrees = 1, ydegrees = 1, xordinal = FALSE, yordinal = FALSE)
cv(fitlin)  ## CV error of prediction



