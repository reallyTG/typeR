library(palettetown)


### Name: scale_colour_poke
### Title: Add a pokemon palette to a ggplot2 colour or fill scale.
### Aliases: scale_color_poke scale_colour_poke scale_fill_poke

### ** Examples

library(ggplot2)
qplot(Sepal.Length, Sepal.Width, colour = Species, data=iris) +
 scale_colour_poke(pokemon = 'Metapod')



