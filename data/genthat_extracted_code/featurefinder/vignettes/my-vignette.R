## ---- fig.show='hold', fig.width=7, fig.height=7-------------------------
requireNamespace("png", quietly = TRUE)
setwd("C:\\Users\\davis_000\\Dropbox\\00 latex\\2018\\featurefinder")
img <- png::readPNG(".\\test\\ALL_ALL_medres2.png")
grid::grid.raster(img)

