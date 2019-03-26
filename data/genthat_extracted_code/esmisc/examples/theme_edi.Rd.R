library(esmisc)


### Name: theme_edi
### Title: Custom ggplot2 theme
### Aliases: theme_edi

### ** Examples

library(ggplot2)
p <- ggplot(mtcars) + 
 geom_point(aes(x = wt, y = mpg, 
colour=factor(gear))) + facet_wrap(~am)
p
p + theme_edi()



