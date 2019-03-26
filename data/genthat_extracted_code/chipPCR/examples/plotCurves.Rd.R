library(chipPCR)


### Name: plotCurves
### Title: Plot Curves in an Orthogonal Matrix
### Aliases: plotCurves
### Keywords: hplot

### ** Examples

# First example
plotCurves(VIMCFX96_60[, 1], VIMCFX96_60[, 2L:16], type = "l")

# Second example
y <- VIMCFX96_60[, 2L:16]
# Introduce some missing values.
y[c(1,4,5,6,23,34), c(2,4,9,15)] <- NA
plotCurves(VIMCFX96_60[, 1], y, nrow = 4, type = "l")

# Third example
# Same as second example but the CPP option is set to TRUE.
# Noise and missing values will be removed. 

y <- VIMCFX96_60[, 2L:16]
# Introduce some missing values.
y[c(1,4,5,6,23,34), c(2,4,9,15)] <- NA
plotCurves(VIMCFX96_60[, 1], y, nrow = 4, CPP = TRUE, type = "l")

# Fourth example
plotCurves(VIMCFX96_60, y = NULL, one.plot = TRUE, type = "l")
plotCurves(VIMCFX96_60, y = NULL, one.plot = FALSE, type = "l")





