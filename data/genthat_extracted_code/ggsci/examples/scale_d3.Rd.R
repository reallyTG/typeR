library(ggsci)


### Name: scale_color_d3
### Title: D3.js Color Scales
### Aliases: scale_color_d3 scale_colour_d3 scale_fill_d3

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

p1 + scale_color_d3()
p2 + scale_fill_d3()

p1 + scale_color_d3(palette = "category20")
p2 + scale_fill_d3(palette = "category20")

p1 + scale_color_d3(palette = "category20b")
p2 + scale_fill_d3(palette = "category20b")

p1 + scale_color_d3(palette = "category20c")
p2 + scale_fill_d3(palette = "category20c")



