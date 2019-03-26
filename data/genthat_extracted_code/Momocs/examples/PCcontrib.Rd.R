library(Momocs)


### Name: PCcontrib
### Title: Shape variation along PC axes
### Aliases: PCcontrib PCcontrib.PCA

### ** Examples

bot.p <- PCA(efourier(bot, 12))
PCcontrib(bot.p)
## Not run: 
##D library(ggplot2)
##D gg <- PCcontrib(bot.p, nax=1:8, sd.r=c(-5, -3, -2, -1, -0.5, 0, 0.5, 1, 2, 3, 5))
##D gg + geom_polygon(fill="slategrey", col="black") + ggtitle("A nice title")
## End(Not run)



