library(sisal)


### Name: sisalTable
### Title: Draw Table with Equally Sized Cells
### Aliases: sisalTable
### Keywords: hplot

### ** Examples

library(grDevices)
library(grid)
## Default: 3 by 4 table with labels 1:12 and random background colors
grid.newpage()
sisalTable()

## Four examples in a grid layout
rowCol <- c(1, 18, 2, 18, 1)
lo <- grid.layout(nrow = 5, ncol = 5,
                  widths = rowCol, heights = rowCol)
grid.newpage()
pushViewport(viewport(layout = lo, name = "bgLayout"))
grid.rect(gp=gpar(fill="grey75", col="grey75"))

rNames <- c("topmargin", "top", "hspace", "bottom", "bottommargin")
cNames <- c("leftmargin", "left", "vspace", "right", "rightmargin")
for (Row in c(2, 4)) {
    for (Col in c(2, 4)) {
        pushViewport(viewport(layout.pos.row = Row,
                              layout.pos.col = Col,
                              name = paste(rNames[Row],
                                           cNames[Col], sep="")))
        grid.rect(gp=gpar(fill="cadetblue"))
        upViewport(1)
    }
}

colors1Vec <- terrain.colors(12)
colors1Mat <- matrix(colors1Vec, 3, 4)
labels1Vec <- sample(c(letters, LETTERS), 12)
labels1Mat <- matrix(labels1Vec, 3, 4)

## Column vector, aligned with the right side of the viewport
longText <- rep("", 12)
longText[3] <- "a longish piece of text"
longText[9] <- "and some more"
sisalTable(labels1Vec, bg = colors1Vec, vp = "topleft",
           x = 1, just = "right",
           yAxisLabels = longText, xAxisLabels = "Boo")

## Matrix, zero margin
downViewport("topright")
sisalTable(labels1Mat, bg = colors1Mat,
           width = 1, height = 1, name = "trPlot",
           xAxisLabels = 1:4, yAxisLabels = LETTERS[1:3])
grid.rect(width = grobWidth("trPlot"), height = grobHeight("trPlot"),
          gp = gpar(lty="dashed", col = "white", lwd = 2))
upViewport(1)

## Transpose of matrix, width and height 0.75 "npc" units
downViewport("bottomleft")
sisalTable(t(labels1Mat), bg = t(colors1Mat),
           width = 0.75, height = 0.75, name = "blPlot",
           yAxisLabels = 1:4, xAxisLabels = LETTERS[1:3])
grid.rect(width = grobWidth("blPlot"), height = grobHeight("blPlot"),
          gp = gpar(lty="dashed", col = "white", lwd = 2))
upViewport(1)

## ?plotmath, some cells with no background color
labels2 <- expression(x^{y+x}, sqrt(x), bolditalic(x), NA)
bgCol <- c(rep("white", 3), NA)
sisalTable(labels2, nRows=3, nCols=5, bg = bgCol, naFill = NA,
           naStripes = "darkmagenta", vp="bottomright",
           main = "plotmath text")



