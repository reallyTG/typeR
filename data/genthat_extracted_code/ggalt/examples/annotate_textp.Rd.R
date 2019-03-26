library(ggalt)


### Name: annotate_textp
### Title: Text annotations in plot coordinate system
### Aliases: annotate_textp

### ** Examples

p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p <- p + geom_smooth(method = "lm", se = FALSE)
p + annotate_textp(x = 0.9, y = 0.35, label="A relative linear\nrelationship", hjust=1, color="red")



