library(envalysis)


### Name: theme_publish
### Title: ggplot2 theme for scientific publications
### Aliases: theme_publish

### ** Examples

require(ggplot2)
p <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg,
     colour=factor(gear))) + facet_wrap( ~ am)
p
p + theme_publish()




