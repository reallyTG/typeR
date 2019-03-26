library(xRing)


### Name: measureProfiles
### Title: Measure Profiles Interactively
### Aliases: measureProfiles

### ** Examples

if(interactive()){
# read a sample file
  im <- imRead(file = system.file("img", "AFO1046.1200dpi.png", package="xRing"))

# to display the image
  imDisplay(im)

 cal1 <- calibrateFilm(im, thickness = stepIncrease(0.24, 7), density = 1.2922, plot = TRUE)
 profiles <- measureProfiles(im, cal = cal1)
}



