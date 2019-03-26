library(ggsci)


### Name: scale_color_uchicago
### Title: The University of Chicago Color Scales
### Aliases: scale_color_uchicago scale_colour_uchicago scale_fill_uchicago

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

p1 + scale_color_uchicago()
p2 + scale_fill_uchicago()

p1 + scale_color_uchicago(palette = "light")
p2 + scale_fill_uchicago(palette = "light")

p1 + scale_color_uchicago(palette = "dark")
p2 + scale_fill_uchicago(palette = "dark")



