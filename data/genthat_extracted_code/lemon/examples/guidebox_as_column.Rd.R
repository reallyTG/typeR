library(lemon)


### Name: guidebox_as_column
### Title: Guidebox as a column
### Aliases: guidebox_as_column

### ** Examples

library(ggplot2)
library(dplyr)

p <- ggplot(diamonds, aes(x=x, y=y, colour=cut)) + geom_point()
guidebox_as_column(p)
p <- p + guides(colour=guide_legend(ncol=2, byrow=TRUE))
guidebox_as_column(p)



