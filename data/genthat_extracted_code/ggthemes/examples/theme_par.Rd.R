library(ggthemes)


### Name: theme_par
### Title: Theme which uses the current 'base' graphics parameter values
###   from 'par()'. Not all 'par()' parameters, are supported, and not all
###   are relevant to 'ggplot2' themes.
### Aliases: theme_par

### ** Examples

library("ggplot2")

p <- ggplot(mtcars) +
  geom_point(aes(x = wt, y = mpg, colour = factor(gear))) +
  facet_wrap(~am)

p + theme_par()

# theme changes with respect to values of par
par(font = 2, col.lab = "red", fg = "white", bg = "black")
p + theme_par()



