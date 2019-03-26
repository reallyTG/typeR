library(StereoMorph)


### Name: drawCheckerboard
### Title: Creates a checkerboard image
### Aliases: drawCheckerboard
### Keywords: grid functions

### ** Examples

## NUMBER OF INTERNAL CORNERS IN THE HORIZONTAL DIMENSION
## NUMBER OF ROWS OF SQUARES MINUS ONE
nx <- 21

## NUMBER OF INTERNAL CORNERS IN THE VERTICAL DIMENSION
## NUMBER OF COLUMNS OF SQUARES MINUS ONE
ny <- 14

## SQUARE SIZE IN PIXELS
square.size <- 200

## WHERE TO SAVE THE FILE
filename <- paste0("checkerboard_", nx, "_", ny, "_", square.size, ".jpeg")

## Not run: 
##D ## DRAW CHECKERBOARD
##D ## FILE WILL BE CREATED IN CURRENT WORKING DIRECTORY
##D drawCheckerboard(nx=nx, ny=ny, square.size=square.size, filename=filename)
## End(Not run)



