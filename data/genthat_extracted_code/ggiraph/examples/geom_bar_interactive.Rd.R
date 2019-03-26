library(ggiraph)


### Name: geom_bar_interactive
### Title: interactive bars
### Aliases: geom_bar_interactive

### ** Examples

library(ggplot2)
g <- ggplot(mpg, aes( x = class, tooltip = class,
        data_id = class ) ) +
  geom_bar_interactive()
ggiraph(code = print(g))

dat <- data.frame( name = c( "David", "Constance", "Leonie" ),
    gender = c( "Male", "Female", "Female" ),
    height = c(172, 159, 71 ) )
g <- ggplot(dat, aes( x = name, y = height, tooltip = gender,
        data_id = name ) ) +
  geom_bar_interactive(stat = "identity")
ggiraph(code = print(g))



