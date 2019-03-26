library(matlab)


### Name: colorbar
### Title: MATLAB colorbar function
### Aliases: colorbar
### Keywords: hplot

### ** Examples

doPlot <- function(C,
                   cb.loc=c("EastOutside",
                            "WestOutside",
                            "NorthOutside",
                            "SouthOutside"),
                   ...) {
    saved.par <- par(no.readonly=TRUE)
    on.exit(par(saved.par))

    layout.EO <- function() {
        ## divide the device into one row and nine columns
        ## allocate figure 1 the first eight columns
        ## allocate figure 2 the last column
        layout(matrix(c(1, 1, 1, 1, 1, 1, 1, 1, 2), ncol=9))
    }

    layout.WO <- function() {
        ## divide the device into one row and nine columns
        ## allocate figure 1 the last eight columns
        ## allocate figure 2 the first column
        layout(matrix(c(2, 1, 1, 1, 1, 1, 1, 1, 1), ncol=9))
    }

    layout.NO <- function() {
        ## divide the device into six rows and one column
        ## allocate figure 1 the last five rows
        ## allocate figure 2 the first row
        layout(matrix(c(2, 1, 1, 1, 1, 1), nrow=6))
    }

    layout.SO <- function() {
        ## divide the device into six rows and one column
        ## allocate figure 1 the first five rows
        ## allocate figure 2 the last row
        layout(matrix(c(1, 1, 1, 1, 1, 2), nrow=6))
    }

    location <- match.arg(cb.loc)
    switch(EXPR=location,
           EastOutside  = layout.EO(),
           WestOutside  = layout.WO(),
           NorthOutside = layout.NO(),
           SouthOutside = layout.SO())

    imagesc(C, ...)
    colorbar(C, location, ...)
}

values <- matrix(c(seq(1,  5, by=1),
                   seq(2, 10, by=2),
                   seq(3, 15, by=3)), nrow=3, byrow=TRUE)

dev.new(width=8, height=7)
doPlot(values, "EastOutside", col=jet.colors(16))



