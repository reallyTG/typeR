library(grImport2)


### Name: readPicture
### Title: Import a Cairo SVG image
### Aliases: readPicture

### ** Examples

options(warn=1)

## NOT a Cairo SVG file
badfile <- system.file("SVG", "lwd.svg", package="grImport2")
## A Cairo SVG file
goodfile <- system.file("SVG", "lwd-rsvg.svg", package="grImport2")

## Warning because NOT a Cairo SVG file
## (and it will not render correctly)
img <- readPicture(badfile)

## No warning
## (and it will render correctly)
img <- readPicture(goodfile)

if (require("rsvg")) {
    ## Generate a Cairo SVG file
    goodfile <- tempfile(fileext = ".svg")
    rsvg_svg(badfile, goodfile)

    ## No warning
    ## (and it will render correctly)
    img <- readPicture(goodfile)

}

options(warn=0)



