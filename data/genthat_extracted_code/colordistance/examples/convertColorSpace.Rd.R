library(colordistance)


### Name: convertColorSpace
### Title: Convert between color spaces
### Aliases: convertColorSpace

### ** Examples

# Convert a single RGB triplet and then back convert it
rgb_color <- c(0, 1, 0)
lab_color <- colordistance::convertColorSpace(rgb_color,
 from="sRGB", to="Lab", to.ref.white="D65")
rgb_again <- colordistance::convertColorSpace(lab_color,
 from="Lab", to="sRGB", from.ref.white="D65")

# Convert pixels from loadImage() function
img <- colordistance::loadImage(system.file("extdata",
"Heliconius/Heliconius_B/Heliconius_07.jpeg", package="colordistance"))
lab_pixels <- colordistance::convertColorSpace(img$filtered.rgb.2d,
from="sRGB", to="XYZ", sample.size=5000)

# Convert clusters
img <- colordistance::loadImage(system.file("extdata",
"Heliconius/Heliconius_B/Heliconius_07.jpeg", package="colordistance"))
img_hist <- colordistance::getImageHist(img, bins=2, plotting=FALSE)
lab_clusters <- colordistance::convertColorSpace(img_hist, to.ref.white="D55")




