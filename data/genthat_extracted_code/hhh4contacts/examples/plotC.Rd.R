library(hhh4contacts)


### Name: plotC
### Title: Generate an Image of a Contact Matrix
### Aliases: plotC

### ** Examples

## contour plot
plotC(contactmatrix_POLYMOD, contour = TRUE)

## level plots illustrating aggregation of age groups
if (require("gridExtra")) {
    grid.arrange(plotC(contactmatrix_POLYMOD, grouping = c(1,2,2,4,4,2)),
                 plotC(contactmatrix(grouping = c(1,2,2,4,4,2))),
                 nrow = 1)
}




