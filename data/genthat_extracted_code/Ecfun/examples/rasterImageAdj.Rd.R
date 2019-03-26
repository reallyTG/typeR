library(Ecfun)


### Name: rasterImageAdj
### Title: rasterImage adjusting to zero distortion
### Aliases: rasterImageAdj
### Keywords: hplot

### ** Examples

# something to plot 
logo.jpg <- paste(R.home(), "doc", "html", "logo.jpg",
                  sep = .Platform$file.sep)
if(require(jpeg)){
##
## 1.  Shrink as required
##
  Rlogo <- readJPEG(logo.jpg)
  ## Don't show: 
stopifnot(
## End(Don't show)
  all.equal(dim(Rlogo), c(76, 100, 3))
  ## Don't show: 
)
## End(Don't show)

  plot(1:2)
# default
  rasterImageAdj(Rlogo)

  plot(1:2, type='n', asp=0.75)
# Tall and thin
  rasterImage(Rlogo, 1, 1, 1.2, 2)
# Fix
  rasterImageAdj(Rlogo, 1.2, 1, 1.4, 2)

# short and wide
  rasterImage(Rlogo, 1.4, 1, 2, 1.2)
# Fix
  rasterImage(Rlogo, 1.4, 1.2, 2, 1.4)
##
## 2.  rotate 
##
#  2.1.  angle=90:  rasterImage left of rasterImageAdj
  plot(0:1, 0:1, type='n', asp=1)
  rasterImageAdj(Rlogo, .5, .5, 1, 1, 90)
  rasterImage(Rlogo, .5, .5, 1, 1, 90)
#  2.2.  angle=180:  rasterImage left and below 
  plot(0:1, 0:1, type='n', asp=1)
  rasterImageAdj(Rlogo, .5, .5, 1, 1, 180)
  rasterImage(Rlogo, .5, .5, 1, 1, 180)
#  2.3.  angle=270:  rasterImage below 
  plot(0:1, 0:1, type='n', asp=1)
  rasterImageAdj(Rlogo, .5, .5, 1, 1, 270)
  rasterImage(Rlogo, .5, .5, 1, 1, 270)
## 
## 3.  subset 
##
dim(Rlogo)
# 76 100 3
Rraster <- as.raster(Rlogo)
dim(Rraster)
# 76 100:  
# x=1:100, left to right 
# y=1:76, top to bottom 
rasterImageAdj(Rlogo, 0, 0, .5, .5, xsub=40:94)
}



