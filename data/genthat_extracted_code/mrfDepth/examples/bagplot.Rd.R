library(mrfDepth)


### Name: bagplot
### Title: Draws a bagplot, a bivariate boxplot
### Aliases: bagplot
### Keywords: Graphical

### ** Examples

data(bloodfat)

# The bagplot can be plotted for the halfspace depth,
# the projection depth or the skewness-adjusted projection depth.
# Note that the projection depth is not appropiate for skewed data.
bagplot(compBagplot(bloodfat))
bagplot(compBagplot(bloodfat, type = "projdepth"))
bagplot(compBagplot(bloodfat, type = "sprojdepth"))

# The mean features of the bagplot can easily be adjusted.
result <- compBagplot(bloodfat)
bagplot(result, databag = FALSE, dataloop = FALSE)
bagplot(result, colorbag = rgb(0.2,0.2,0.2), colorloop = "green")


data(cardata90)
result <- compBagplot(cardata90)
bagplot(result)

# Compared to the original paper on the bagplot,
# an additional outlier is identified. However this
# point lies very close to the fence and this may be
# attributed to differences in numerical rounding.
# This may be illustrated by plotting the fence.
plot <- bagplot(result, plot.fence = TRUE)
plot

# The returned object is a ggplot2 object and may be
# edited using standard ggplot2 commands.
library("ggplot2")
plot + ylab("Engine displacement") + xlab("Weight in pounds")





