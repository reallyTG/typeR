library(secr)


### Name: skink
### Title: Skink Pitfall Data
### Aliases: skink infraCH lineoCH LStraps
### Keywords: datasets

### ** Examples

summary (infraCH)
summary (lineoCH)

## check mean distance to nearest trap etc.
summary(LStraps)

## LStraps has several site covariates; terse descriptions are in
##  an extra attribute that may be displayed thus
attr(LStraps, "habitat.variables")

## For density modelling we need covariate values at each point in the
## habitat mask. This requires both on-grid interpolation and
## extrapolation beyond the grids. One (crude) possibility is to
## extrapolate a mask covariate from a covariate of the nearest trap:

LSmask <- make.mask(LStraps, buffer = 30, type = "trapbuffer")
temp <- nearesttrap(LSmask, LStraps)
habclass <- covariates(LStraps)$class[temp]
habclass <- factor (habclass, levels = c(1,2))
covariates(LSmask) <- data.frame(habclass)

## plot mask with colour-coded covariate
par(fg = "white")  ## white pixel borders
plot (LSmask, covariate = "habclass", dots = FALSE, axes = FALSE,
    col = c("yellow", "green"), border = 0)
plot(LStraps, add = TRUE, detpar = list(pch = 16))
par(fg = "black")    ## default



