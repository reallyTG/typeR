library(ggmap)


### Name: theme_inset
### Title: Make a ggplot2 inset theme.
### Aliases: theme_inset

### ** Examples

library(ggplot2)
## Not run: 
##D 
##D 
##D n <- 50
##D df <- expand.grid(x = 1:n,y = 1:n)[sample(n^2,.5*n^2),]
##D qplot(x, y, data = df, geom = 'tile')
##D qplot(x, y, data = df, geom = 'tile') + theme_nothing()
##D 
##D qplot(1:10, 1:10) +
##D   annotation_custom(
##D     grob = ggplotGrob(qplot(1:10,1:10)),
##D     8, Inf, -Inf, 2
##D   )
##D 
##D qplot(1:10, 1:10) +
##D   annotation_custom(
##D     grob = ggplotGrob(qplot(1:10,1:10) + theme_nothing()),
##D     8, Inf, -Inf, 2
##D   )
##D 
##D qplot(1:10, 1:10) +
##D   annotation_custom(
##D     grob = ggplotGrob(qplot(1:10,1:10) + theme_inset()),
##D     8, Inf, -Inf, 2
##D   )
##D 
## End(Not run)




