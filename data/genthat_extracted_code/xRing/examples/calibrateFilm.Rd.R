library(xRing)


### Name: calibrateFilm
### Title: Calibrate Film
### Aliases: calibrateFilm

### ** Examples

if(interactive()){
# read a sample file
 im <- imRead(file = system.file("img", "AFO1046.1200dpi.png", package="xRing"))

# display the image
  imDisplay(im)
  
# calibrate the film:
  calibration <- calibrateFilm(im,
                               thickness = stepIncrease(0.24, 7),
                               density = 1.2922,
                               plot = TRUE)
}




