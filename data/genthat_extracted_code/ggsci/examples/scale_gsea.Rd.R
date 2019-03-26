library(ggsci)


### Name: scale_color_gsea
### Title: The GSEA GenePattern Color Scales
### Aliases: scale_color_gsea scale_colour_gsea scale_fill_gsea

### ** Examples

library("ggplot2")
library("reshape2")
data("mtcars")

cor = cor(mtcars)
cor_melt = melt(cor)

ggplot(cor_melt,
       aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(colour = "black", size = 0.3) +
  theme_bw() + scale_fill_gsea()



