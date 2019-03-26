library(StereoMorph)


### Name: findCheckerboardCorners
### Title: Finds internal corners of a checkerboard pattern
### Aliases: findCheckerboardCorners
### Keywords: grid functions calibration

### ** Examples


## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## FIND 5 X 3 INTERNAL CORNERS IN A SINGLE IMAGE
corners <- findCheckerboardCorners(image.file=paste0(fdir, 
     "Checkerboards/RUlna.JPG"), perim.min=180, nx=5, ny=3)

## FIND 5 X 3 INTERNAL CORNERS IN ALL IMAGES IN A FOLDER (HERE 3)
corners <- findCheckerboardCorners(image.file=paste0(fdir, 
     "Checkerboards"), perim.min=180, nx=5, ny=3)

## WHICH DIMENSIONS ARE ASSIGNED TO NX AND NY IS ARBITRARY BUT REVERSING
## THESE WILL CHANGE THE SEQUENCE IN WHICH THE CORNERS ARE RETURNED
corners <- findCheckerboardCorners(image.file=paste0(fdir, 
     "Checkerboards/RUlna.JPG"), perim.min=180, nx=3, ny=5)



