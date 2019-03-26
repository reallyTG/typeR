library(ggsci)


### Name: scale_color_igv
### Title: Integrative Genomics Viewer (IGV) Color Scales
### Aliases: scale_color_igv scale_colour_igv scale_fill_igv

### ** Examples

library("ggplot2")
data("diamonds")

p1 = ggplot(subset(diamonds, carat >= 2.2),
            aes(x = table, y = price, colour = cut)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
  theme_bw()

p2 = ggplot(subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
            aes(x = depth, fill = cut)) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_bw()

p1 + scale_color_igv()
p2 + scale_fill_igv()

p1 + scale_colour_manual(
  values = rep(pal_igv("alternating")(2), times = 3))
p2 + scale_fill_manual(
  values = rep(pal_igv("alternating")(2), times = 3))



