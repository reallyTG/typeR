library(metR)


### Name: scale_divergent
### Title: Divergent color scales
### Aliases: scale_divergent scale_color_divergent scale_fill_divergent

### ** Examples

library(ggplot2)
ggplot(reshape2::melt(volcano), aes(Var1, Var2, z = value)) +
  geom_contour(aes(color = ..level..)) +
  scale_color_divergent(midpoint = 130)




