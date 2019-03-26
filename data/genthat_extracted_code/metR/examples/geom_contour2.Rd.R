library(metR)


### Name: geom_contour2
### Title: 2d contours of a 3d surface
### Aliases: geom_contour2 GeomContour2 stat_contour2 StatContour2
### Keywords: datasets

### ** Examples

library(ggplot2)
ggplot(reshape2::melt(volcano), aes(Var1, Var2)) +
    geom_contour2(aes(z = value, color = ..level..),
                  breaks = AnchorBreaks(130, binwidth = 11))




