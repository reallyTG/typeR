library(viridis)


### Name: scale_color_viridis
### Title: Viridis color scales
### Aliases: scale_color_viridis scale_colour_viridis scale_color_viridis
###   scale_fill_viridis

### ** Examples

library(ggplot2)

# ripped from the pages of ggplot2
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point(size=4, aes(colour = factor(cyl))) +
    scale_color_viridis(discrete=TRUE) +
    theme_bw()

# ripped from the pages of ggplot2
dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
dsub$diff <- with(dsub, sqrt(abs(x-y))* sign(x-y))
d <- ggplot(dsub, aes(x, y, colour=diff)) + geom_point()
d + scale_color_viridis() + theme_bw()


# from the main viridis example
dat <- data.frame(x = rnorm(10000), y = rnorm(10000))

ggplot(dat, aes(x = x, y = y)) +
  geom_hex() + coord_fixed() +
  scale_fill_viridis() + theme_bw()

library(ggplot2)
library(MASS)
library(gridExtra)

data("geyser", package="MASS")

ggplot(geyser, aes(x = duration, y = waiting)) +
  xlim(0.5, 6) + ylim(40, 110) +
  stat_density2d(aes(fill = ..level..), geom="polygon") +
  theme_bw() +
  theme(panel.grid=element_blank()) -> gg

grid.arrange(
  gg + scale_fill_viridis(option="A") + labs(x="Virdis A", y=NULL),
  gg + scale_fill_viridis(option="B") + labs(x="Virdis B", y=NULL),
  gg + scale_fill_viridis(option="C") + labs(x="Virdis C", y=NULL),
  gg + scale_fill_viridis(option="D") + labs(x="Virdis D", y=NULL),
  gg + scale_fill_viridis(option="E") + labs(x="Virdis E", y=NULL),
  ncol=3, nrow=2
)




