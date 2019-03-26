library(imager)


### Name: ci
### Title: Concatenation for image lists
### Aliases: ci

### ** Examples


l1 <- imlist(boats,grayscale(boats))
l2 <- imgradient(boats,"xy")
ci(l1,l2) #List + list
ci(l1,imfill(3,3)) #List + image
ci(imfill(3,3),l1,l2) #Three elements, etc.



