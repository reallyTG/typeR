library(MtreeRing)


### Name: nearPith
### Title: Calibrate ring-width series
### Aliases: nearPith

### ** Examples

## Find the image file name in package MtreeRing:
img.name <- system.file("arc.png", package = "MtreeRing")

## Read and plot the image:
t1 <- imgInput(img = img.name, dpi = 1200)

## Use the arcs of inner rings to calibrate ring-width series:
## No test: 
t2 <- nearPith(ring.data = t1, inner.arc = TRUE, last.yr = 2016) 
## End(No test)


## Try another method to measure ring widths:
## No test: 
t3 <- nearPith(ring.data = t1, inner.arc = FALSE, last.yr = 2016) 
## End(No test)




