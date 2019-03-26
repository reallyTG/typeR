library(autoimage)


### Name: autolayout
### Title: Divide device into rows and columns
### Aliases: autolayout

### ** Examples

# basic 2x2 layout
autolayout(c(2, 2))
# 3x2 layout with space for legends
autolayout(c(3, 2), legend = "h")
autolayout(c(3, 2), legend = "v")
# 3x2 layout with individuals legends
autolayout(c(3, 2), legend = "h", common.legend = FALSE)
autolayout(c(3, 2), legend = "v", common.legend = FALSE)
# if outer title is desired
autolayout(c(2, 2), outer = TRUE)
# reset oma parameters
par(oma = c(0, 0, 0, 0))
# impact of lratio when legend used
autolayout(c(2, 2), legend = "h", lratio = 0.5)
autolayout(c(2, 2), legend = "h", lratio = 0.2)



