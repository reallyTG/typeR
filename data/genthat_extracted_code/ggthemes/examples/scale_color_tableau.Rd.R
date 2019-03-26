library(ggthemes)


### Name: scale_colour_tableau
### Title: Tableau color scales
### Aliases: scale_colour_tableau scale_fill_tableau scale_color_tableau

### ** Examples

library("ggplot2")

p <- ggplot(mtcars) +
  geom_point(aes(x = wt, y = mpg, colour = factor(gear))) +
  facet_wrap(~am) +
  theme_igray()

palettes <- ggthemes_data[["tableau"]][["color-palettes"]][["regular"]]
for (palette in head(names(palettes), 3L)) {
  print(p + scale_colour_tableau(palette) +
          ggtitle(palette))
}



