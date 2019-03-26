library(MtreeRing)


### Name: calcRingWidth
### Title: Generate a ring-width series
### Aliases: calcRingWidth

### ** Examples

## Find the image file name in package MtreeRing:
img.name <- system.file("001.png", package = "MtreeRing")

## Read and plot the image:
t1 <- imgInput(img = img.name, dpi = 1200)

## Split a long core sample into 3 pieces to
## get better display performance and use the
## watershed algorithm to detect ring borders:
t2 <- autoDetect(ring.data = t1, seg = 3, method = 'watershed')

## Calculate ring widths from the attribute list of t2:
rw.df <- calcRingWidth(ring.data = t2, seriesID = "940220")




