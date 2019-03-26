library(xRing)


### Name: imDisplay
### Title: Display Image Using tcltk Package
### Aliases: imDisplay

### ** Examples

if(interactive()){
 file_path <- system.file("img", "AFO1046.1200dpi.png", package="xRing")
 im <- imRead(file_path)
 tkWin <- imDisplay(im, zoom = .25)
 tkWin$env$ZOOM # 4 means 25% zoom
 }
 



