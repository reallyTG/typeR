library(IDPmisc)


### Name: draw.leg
### Title: Produce a Legend or Key (Grid Function)
### Aliases: draw.leg
### Keywords: dplot

### ** Examples

require(grid)

## Legend 2 cm below and 1 cm left of the upper right corner
grid.newpage()
key <- draw.leg(key =
                    list(rectangles = list(col=1:3,
                             size = 2,
                             lwd = 0.5),
                         text = list(LETTERS[1:3]),
                         cex = 1.2,
                         between = 2,
                         between.rows = 0.5,
                         between.title = 0.7,
                         title = "component",
                         cex.title = 1.4,
                         transparent = TRUE))

vp.key <-  viewport(x = convertX(unit(1,"npc")-unit(1,"cm"),"cm"),
                    y = convertY(unit(1,"npc")-unit(2,"cm"),"cm"),
                    width=grobWidth(key),
                    height=grobHeight(key),
                    just=c("right","top"))

pushViewport(vp.key)
grid.draw(key)
popViewport()

##----------------------------------------
## Legend 1 cm above the lower left corner
key <- draw.leg(key = list(rectangles = list(col=1:3,
                             size = 4,
                             lwd = 0.5),
                  text=list(letters[1:3]),
                  lines=list(col=1:3),
                  cex=2,
                  between=2,
                  between.rows=0.5,
                  between.title=0.7,
                  title = "component",
                  adj.title = 0,
                  cex.title = 2.4,
                  transparent = TRUE))

vp.key <-  viewport(x = 0,
                    y = unit(1,"cm"),
                    width=grobWidth(key),
                    height=grobHeight(key),
                    just=c("left","bottom"))

grid.newpage()
pushViewport(vp.key)
grid.draw(key)
popViewport()



