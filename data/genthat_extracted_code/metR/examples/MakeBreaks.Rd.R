library(metR)


### Name: MakeBreaks
### Title: Functions for making breaks
### Aliases: MakeBreaks AnchorBreaks

### ** Examples


my_breaks <- MakeBreaks(10)
my_breaks(c(1, 100))
my_breaks(c(1, 100), 20)    # optional new binwidth argument ignored

MakeBreaks()(c(1, 100), 20)  # but is not ignored if initial binwidth is NULL

# One to one mapping between contours and breaks
library(ggplot2)
binwidth <- 20
ggplot(reshape2::melt(volcano), aes(Var1, Var2, z = value)) +
    geom_contour(aes(color = ..level..), binwidth = binwidth) +
    scale_color_continuous(breaks = MakeBreaks(binwidth))

#Two ways of getting the same contours. Better use the second one.
ggplot(reshape2::melt(volcano), aes(Var1, Var2, z = value)) +
    geom_contour2(aes(color = ..level..), breaks = AnchorBreaks(132),
                  binwidth = binwidth) +
    geom_contour2(aes(color = ..level..), breaks = AnchorBreaks(132, binwidth)) +
    scale_color_continuous(breaks = AnchorBreaks(132, binwidth))




