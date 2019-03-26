library(DescTools)


### Name: FindColor
### Title: Get Color on a Defined Color Range
### Aliases: FindColor
### Keywords: color dplot

### ** Examples


Canvas(7, main="Use of function FindColor()")

# get some data
x <- c(23, 56, 96)
# get a color range from blue via white to red
cols <- colorRampPalette(c("blue","white","red"))(100)
ColorLegend(x="bottomleft", cols=cols, labels=seq(0, 100, 10), cex=0.8)

# and now the color coding of x:
(xcols <- FindColor(x, cols, min.x=0, max.x=100))

# this should be the same as
cols[x+1]

# how does it look like?
y0 <- c(-5, -2, 1)
text(x=1, y=max(y0)+2, labels="Color coding of x:")
text(x=1.5, y=y0, labels=x)
DrawRegPolygon(x=3, y=y0, nv=4, rot=pi/4, col=xcols)
text(x=6, y=y0, labels=xcols)

# how does the function select colors?
Canvas(xlim = c(0,1), ylim = c(0,1))
cols <- c(red="red", yellow="yellow", green="green", blue="blue")
ColorLegend(x=0, y=1, width=1, cols=rev(cols), horiz = TRUE,
            labels=Format(seq(0, 1, .25), digits=2), frame="grey", cex=0.8 )
x <- c(-0.2, 0, 0.15, 0.55, .75, 1, 1.3)
arrows(x0 = x, y0 = 0.6, y1 = 0.8, angle = 15, length = .2)
text(x=x, y = 0.5, labels = x, adj = c(0.5,0.5))
text(x=x, y = 0.4, labels = names(FindColor(x, cols=cols,
   min.x = 0, max.x = 1, all.inside = TRUE)), adj = c(0.5,0.5))
text(x=x, y = 0.3, labels = names(FindColor(x, cols=cols,
   min.x = 0, max.x = 1, all.inside = FALSE)), adj = c(0.5,0.5))



