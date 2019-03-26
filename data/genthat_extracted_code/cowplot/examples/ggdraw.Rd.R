library(cowplot)


### Name: ggdraw
### Title: Set up a drawing layer on top of a ggplot
### Aliases: ggdraw

### ** Examples

p <- ggplot(mpg, aes(displ, cty)) + geom_point()
ggdraw(p) + draw_label("Draft", colour = "grey", size = 120, angle = 45)



