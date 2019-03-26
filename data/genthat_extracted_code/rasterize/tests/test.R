
library(rasterize)

## Check that viewport tree is set up properly on temporary PNG device
grid.newpage()
grid.rect()
pushViewport(viewport(width=.5, name="vp1"),
             viewport(height=.5, name="vp2"))
upViewport(0)
grid.rect(vp="vp1::vp2", name="r")
grid.rasterize("r")

## Simple grob dependency
grid.newpage()
grid.circle(r=.3, name="c")
grid.rect(x=grobX("c", 0), just="left",
          width=.2, height=.3, name="r")
grid.rasterize("r|c", grep=TRUE, global=TRUE, merge=TRUE)

## Rasterize in rotated viewport
grid.newpage()
pushViewport(viewport(width=.5, height=.5, angle=30))
grid.rect()
grid.text("test", name="t")
grid.rasterize("t")
upViewport()
