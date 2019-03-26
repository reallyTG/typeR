## ----echo=FALSE, message=FALSE-------------------------------------------
require(colorpatch)
require(ggplot2)
require(grid)
require(gridExtra)
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
set.seed(173)

## ---- echo = TRUE, message = FALSE---------------------------------------
dat <- CreateClusteredData(ncol.clusters = 3, nrow.clusters = 3, 
                           nrow = 25, ncol = 15, alpha = 50)

## ---- echo = TRUE--------------------------------------------------------
dat <- OrderData(dat)
df <- ToDataFrame(dat)

## ------------------------------------------------------------------------
thresh.ratio <- 0.5 * max(abs(dat$ratio))
thresh.conf <- 0.5 * max(dat$conf)

## ---- fig.show='hold', fig.cap='Comparing three different visualizations'----
p <- ggplot(df, aes(ratio = ratio, conf = conf, x = x, y = y))
p <- p + theme_colorpatch(plot.background = "white") + coord_fixed(ratio = 1)

p + stat_colorpatch(aes(ratio = ratio, conf = 1, x = x, y = y),
                     thresh.ratio = thresh.ratio,
                    color.fun = ColorPatchColorFun("GreenRedRGB")) + 
  ggtitle("(a) standard green/red")

p + stat_bicolor(thresh.ratio = thresh.ratio,
                thresh.conf = thresh.conf) +
  ggtitle("(b) HSV bivariate")

p + stat_colorpatch(thresh.ratio = thresh.ratio, 
                    thresh.conf = thresh.conf) +
  ggtitle("(c) patch grid")

## ---- fig.show='hold', fig.cap='Comparing the uniformity of standard RGB and OPT palette. The Euclidean distances within the LAB colorspace between adjacent colors are shown.'----
data("GreenRedRGB")
data("OptimGreenRedLAB")
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 1),
                       gp = gpar(fill = "black", col = "black", lwd = 0)))
p0 <- PlotUniformity(GreenRedRGB) + ggtitle("GreenRedRGB Uniformity")
p1 <- PlotUniformity(OptimGreenRedLAB) + ggtitle("OptimGreenRedLAB Uniformity")
print(p0, vp = vplayout(1, 1))
print(p1, vp = vplayout(2, 1))
popViewport()

