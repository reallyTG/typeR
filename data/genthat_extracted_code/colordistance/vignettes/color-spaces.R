## ---- echo=F-------------------------------------------------------------
knitr::opts_chunk$set(
  fig.align="center"
)

## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE, fig.show='hold', fig.align="center", fig.width=4, fig.height=4, results=F----
rgb.10000 <- cbind(runif(10000, min = 0, max = 1),
                   runif(10000, min = 0, max = 1),
                   runif(10000, min = 0, max = 1))
scatterplot3d::scatterplot3d(rgb.10000,
              color = rgb(rgb.10000), pch = 19,
              main = "RGB", 
              xlab = "Red", 
              ylab = "Green", 
              zlab = "Blue",
              angle = 45)

scatterplot3d::scatterplot3d(rgb.10000,
                             color = rgb(rgb.10000), pch = 19,
                             main = "RGB", 
                             xlab = "Red", 
                             ylab = "Green", 
                             zlab = "Blue",
                             angle = -45)

## ---- echo = FALSE, fig.show='hold', fig.align="center", fig.width=4, fig.height=4, results=F----
hsv.10000 <- t(rgb2hsv(t(rgb.10000), maxColorValue = 1))

scatterplot3d::scatterplot3d(hsv.10000,
                             color = apply(hsv.10000, 1, function(i) hsv(h=i[1], s=i[2], v=i[3])),
                             pch = 19, main = "HSV", angle = -45,
                             xlab = "Hue", ylab = "Saturation", zlab = "Value")
scatterplot3d::scatterplot3d(hsv.10000,
                             color = apply(hsv.10000, 1, function(i) hsv(h=i[1], s=i[2], v=i[3])),
                             pch = 19, main = "HSV", angle = 45,
                             xlab = "Hue", ylab = "Saturation", zlab = "Value")


## ---- echo = FALSE, fig.show='hold', fig.align="center", fig.width=4, fig.height=4, results=F----
plotLab <- function(pix, title, ref.white, angle = -45,
                    xlim = c(0, 100), 
                    ylim = c(-128, 127),
                    zlim = c(-128, 127)) {
  
  colExp <- rgb(suppressMessages(colordistance::convertColorSpace(pix, from = "Lab", to = "sRGB", 
                                                   sample.size = "all", 
                                                   from.ref.white = ref.white)))
  
  scatterplot3d::scatterplot3d(pix, color = colExp, pch = 19, 
                               main = title, xlab = "Luminance", angle = angle,
                               ylab = "a (green-red)", zlab = "b (blue-yellow)",
                               xlim = xlim, ylim = ylim, zlim = zlim)
  
}

lab.10000 <- suppressMessages(colordistance::convertColorSpace(rgb.10000,
                              sample.size = "all", to.ref.white = "D65"))

plotLab(lab.10000, title = "CIELab", ref.white = "D65", angle = 45,
        ylim = range(lab.10000[,2]), zlim=c(-100, 90))
plotLab(lab.10000, title = "CIELab", ref.white = "D65", angle = -45,
        ylim = range(lab.10000[,2]), zlim=c(-100, 90))


## ---- fig.align="center", fig.width=4, fig.height=4, echo=F--------------
path <- system.file("extdata", "Heliconius/Heliconius_B/Heliconius_08.jpeg", package="colordistance")
colordistance::plotImage(path)

## ---- fig.show='hold', fig.align="center", fig.width=4, fig.height=4, results=F----
path <- system.file("extdata", "Heliconius/Heliconius_B/Heliconius_08.jpeg", package="colordistance")
img <- colordistance::loadImage(path, lower = rep(0.8, 3), upper = rep(1, 3),
                                CIELab = TRUE, ref.white = "D65", sample.size = 10000)
colordistance::plotPixels(img, color.space = "rgb", main = "RGB", n = 10000)
colordistance::plotPixels(img, color.space = "lab", ref.white = "D65", n = 10000,
                          main = "CIELab", ylim = c(-100, 100), zlim = c(-50, 100))

