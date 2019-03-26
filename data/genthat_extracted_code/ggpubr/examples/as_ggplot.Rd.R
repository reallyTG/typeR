library(ggpubr)


### Name: as_ggplot
### Title: Storing grid.arrange() arrangeGrob() and plots
### Aliases: as_ggplot

### ** Examples

# Creat some plots
bxp <- ggboxplot(iris, x = "Species", y = "Sepal.Length")
vp <- ggviolin(iris, x = "Species", y = "Sepal.Length",
              add = "mean_sd")

# Arrange the plots in one page
# Returns a gtable (grob) object
library(gridExtra)
gt <- arrangeGrob(bxp, vp, ncol = 2)

# Transform to a ggplot and print
as_ggplot(gt)




