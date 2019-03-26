library(MtreeRing)


### Name: visualSelect
### Title: Edit ring borders visually
### Aliases: visualSelect

### ** Examples

## Find the image file name in package MtreeRing:
img.name <- system.file("001.png", package = "MtreeRing")

## Read and plot the image:
t1 <- imgInput(img = img.name, dpi = 1200)

## Split a long core sample into 3 pieces to
## get better display performance and use the
## watershed algorithm to detect ring borders:
t2 <- autoDetect(ring.data = t1, seg = 3, method = 'watershed')

## Not modify t2, create a new array object t3. Delete 
## some borders without adding new borders:
t3 <- visualSelect(ring.data = t2, del = c(1, 3, 5, 19:21), add = FALSE)




