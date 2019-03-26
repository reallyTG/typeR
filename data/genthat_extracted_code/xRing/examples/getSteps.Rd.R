library(xRing)


### Name: getSteps
### Title: Select the Steps of a Calibration Wedge Interactively
### Aliases: getSteps

### ** Examples

if(interactive()){
# read a sample file
 im <- imRead(file = system.file("img", "AFO1046.1200dpi.png", package="xRing"))

# display the image
  imDisplay(im)

# get the grayvalues from the calibration wedge on the film
  steps <- grayvalues <- getSteps(im, 7) #select 7 ROIs
  steps1 <- grayvalues <- getSteps(im, 7, auto = TRUE) #select a single ROI
  cor(steps, steps1)
}




