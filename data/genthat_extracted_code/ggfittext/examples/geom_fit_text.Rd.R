library(ggfittext)


### Name: geom_fit_text
### Title: A 'ggplot2' geom to fit text inside a box
### Aliases: geom_fit_text

### ** Examples


ggplot2::ggplot(ggplot2::presidential, ggplot2::aes(ymin = start, ymax = end,
    label = name, fill = party, xmin = 0, xmax = 1)) +
  ggplot2::geom_rect(colour = 'black') +
  geom_fit_text(grow = TRUE)




