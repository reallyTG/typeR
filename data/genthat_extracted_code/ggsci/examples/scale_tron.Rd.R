library(ggsci)


### Name: scale_color_tron
### Title: Tron Legacy Color Scales
### Aliases: scale_color_tron scale_colour_tron scale_fill_tron

### ** Examples

library("ggplot2")
data("diamonds")

ggplot(subset(diamonds, carat >= 2.2),
       aes(x = table, y = price, colour = cut)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
  theme_dark() + theme(
    panel.background = element_rect(fill = "#2D2D2D"),
    legend.key = element_rect(fill = "#2D2D2D")) +
  scale_color_tron()

ggplot(subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
       aes(x = depth, fill = cut)) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_dark() + theme(
    panel.background = element_rect(fill = "#2D2D2D")) +
  scale_fill_tron()



