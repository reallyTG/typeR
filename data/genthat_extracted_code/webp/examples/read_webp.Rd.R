library(webp)


### Name: read_webp
### Title: Webp image format
### Aliases: read_webp webp write_webp

### ** Examples

# Convert to webp
library(png)
img <- readPNG(system.file("img", "Rlogo.png", package="png"))
out <- file.path(tempdir(), "rlogo.webp")
write_webp(img, out)
# browseURL(out)

# Convert from webp
library(jpeg)
img <- read_webp(out)
jpeg <- file.path(tempdir(), "rlogo.jpeg")
writeJPEG(img, jpeg)
# browseURL(jpeg)



