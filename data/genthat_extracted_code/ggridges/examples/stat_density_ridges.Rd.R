library(ggridges)


### Name: stat_density_ridges
### Title: Stat for density ridgeline plots
### Aliases: stat_density_ridges StatDensityRidges
### Keywords: datasets

### ** Examples

library(ggplot2)

# Examples of coloring by ecdf or quantiles
library(viridis)
ggplot(iris, aes(x=Sepal.Length, y=Species, fill=factor(..quantile..))) +
  stat_density_ridges(geom = "density_ridges_gradient", calc_ecdf = TRUE,
                      quantiles = 5) +
  scale_fill_viridis(discrete = TRUE, name = "Quintiles") + theme_ridges() +
  scale_y_discrete(expand = c(0.01, 0))

ggplot(iris, aes(x=Sepal.Length, y=Species, fill=0.5 - abs(0.5-..ecdf..))) +
  stat_density_ridges(geom = "density_ridges_gradient", calc_ecdf = TRUE) +
  scale_fill_viridis(name = "Tail probability", direction = -1) + theme_ridges() +
  scale_y_discrete(expand = c(0.01, 0))

ggplot(iris, aes(x=Sepal.Length, y=Species, fill=factor(..quantile..))) +
  stat_density_ridges(geom = "density_ridges_gradient",
                      calc_ecdf = TRUE, quantiles = c(0.025, 0.975)) +
  scale_fill_manual(name = "Probability",
                    values = c("#FF0000A0", "#A0A0A0A0", "#0000FFA0"),
                    labels = c("(0, 0.025]", "(0.025, 0.975]", "(0.975, 1]")) +
  theme_ridges() + scale_y_discrete(expand = c(0.01, 0))



