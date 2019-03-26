library(analogueExtra)


### Name: plot3d.prcurve
### Title: Interactive 3D plot of a principal curve in principal coordinate
###   space
### Aliases: plot3d.prcurve plot3d
### Keywords: dynamic graphics

### ** Examples

## Only works if the analogue package is available
if (require("analogue")) {
    ## Load the Abernethy Forest late glacial pollen sequence
    data(abernethy)

    ## Remove the Depth and Age variables
    abernethy2 <- abernethy[, -(37:38)]

    ## Fit the principal curve using the median complexity over
    ## all species
    aber.pc <- prcurve(abernethy2, method = "ca", trace = TRUE,
                       vary = FALSE, penalty = 1.4)

    ## 3D plot of data with curve superimposed
    ## plot3d.prcurve(aber.pc) # now deprecated, instead use
    plot3d(aber.pc)
}



