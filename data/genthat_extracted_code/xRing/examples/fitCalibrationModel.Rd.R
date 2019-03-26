library(xRing)


### Name: fitCalibrationModel
### Title: Fit a Calibration Curve
### Aliases: fitCalibrationModel

### ** Examples

if(interactive()){
# read a sample file
 im <- imRead(file = system.file("img", "AFO1046.1200dpi.png", package="xRing"))

# display the image
  imDisplay(im)
  
# get the grayvalues from the calibration wedge on the film
  grayvalues <- getSteps(im, 7)

# calibrate the film by fitting a model:
  calibration <- fitCalibrationModel(grayvalues,
                                    thickness = stepIncrease(0.24, 7),
                                    density = 1.2922,
                                    plot = TRUE)
}




