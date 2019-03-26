library(hrbrthemes)


### Name: theme_ipsum_ps
### Title: A precise & pristine ggplot2 theme with opinionated defaults and
###   an emphasis on typoghraphy
### Aliases: theme_ipsum_ps

### ** Examples

## Not run: 
##D library(ggplot2)
##D library(dplyr)
##D 
##D # seminal scatterplot
##D ggplot(mtcars, aes(mpg, wt)) +
##D   geom_point() +
##D   labs(x="Fuel effiiency (mpg)", y="Weight (tons)",
##D        title="Seminal ggplot2 scatterplot example",
##D        subtitle="A plot that is only useful for demonstration purposes",
##D        caption="Brought to you by the letter 'g'") +
##D   theme_ipsum_rc()
##D 
##D # seminal bar chart
##D 
##D # note: make this font_rc on Windows
##D update_geom_font_defaults(family=font_rc_light)
##D 
##D count(mpg, class) %>%
##D   ggplot(aes(class, n)) +
##D   geom_col() +
##D   geom_text(aes(label=n), nudge_y=3) +
##D   labs(x="Fuel effiiency (mpg)", y="Weight (tons)",
##D        title="Seminal ggplot2 bar chart example",
##D        subtitle="A plot that is only useful for demonstration purposes",
##D        caption="Brought to you by the letter 'g'") +
##D   theme_ipsum_rc(grid="Y") +
##D   theme(axis.text.y=element_blank())
## End(Not run)



