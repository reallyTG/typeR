library(ggthemes)


### Name: theme_solarized
### Title: ggplot color themes based on the Solarized palette
### Aliases: theme_solarized theme_solarized_2

### ** Examples

library("ggplot2")

p <- ggplot(mtcars) +
     geom_point(aes(x = wt, y = mpg, colour = factor(gear)))

# Light version with different main accent colors
for (accent in names(ggthemes::ggthemes_data[["solarized"]][["accents"]])) {
  print(p + theme_solarized() +
        scale_colour_solarized(accent))
}

# Dark version
p + theme_solarized(light = FALSE) +
    scale_colour_solarized("blue")

# Alternative theme
p + theme_solarized_2(light = FALSE) +
  scale_colour_solarized("blue")



