## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, fig.width=7, fig.height=4, fig.cap = "Figure 1"--------
library(countcolors)
original.img <- system.file("extdata", "bat_wing.png", package ="countcolors")
pixel.array <- colordistance::loadImage(original.img)
countcolors::plotArrayAsImage(pixel.array$original.rgb)

## ---- echo=FALSE, fig.width=8, fig.height=5, fig.cap = "Figure 2"--------
library(countcolors)
original.img <- system.file("extdata", "photoshop.png", package ="countcolors")
pixel.array <- colordistance::loadImage(original.img)
countcolors::plotArrayAsImage(pixel.array$original.rgb)

## ---- echo=FALSE, fig.width=7, fig.height=5, fig.cap = "Figure 3"--------
library(countcolors)
original.img <- system.file("extdata", "white_bg.png", package ="countcolors")
pixel.array <- colordistance::loadImage(original.img)
countcolors::plotArrayAsImage(pixel.array$original.rgb)

## ---- fig.width = 7------------------------------------------------------
# Load required package:
library(countcolors)

# Define lower and upper limit for color range using RGB pixel coordinates
# Typical RGB values range between 0 and 255, but R scales them to range between
# 0 and 1, where 1 is maximum brightness
lower.rectangular <- c(0.223, 0.222, 0.210)
upper.rectangular <- c(0.411, 0.486, 0.501)

# Define background color that will be excluded (in our case white)
bg.upper <- c(1, 1, 1)
bg.lower <- c(0.8, 0.8, 0.8)

# Define path to background-masked image
# Typically, this will take the format of "[path/to/directory]/image_name.jpeg"
# Here, we're using an image that is included in the package, accessed through
# the system.file function
image.name <- system.file("extdata", "white_bg.png", package = "countcolors")

# Find pixels using rectangular range and replace those pixels with another color
# Magenta is used in this example
wingfraction <- countColors(image.name, color.range = "rectangular", 
                            upper = upper.rectangular, lower = lower.rectangular,
                            bg.upper = bg.upper, bg.lower = bg.lower,
                            target.color = "magenta",
                            plot = TRUE)




