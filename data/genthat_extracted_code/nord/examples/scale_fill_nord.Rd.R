library(nord)


### Name: scale_fill_nord
### Title: #' nord fill scale for ggplot2
### Aliases: scale_fill_nord

### ** Examples

library(ggplot2)
library(nord)

ggplot(diamonds) +
  geom_bar(aes(x = cut, fill = clarity)) +
  scale_fill_nord("victory_bonds")



