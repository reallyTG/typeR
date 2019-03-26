library(spc4sts)


### Name: imposeDefect
### Title: Superimpose A Local Defect
### Aliases: imposeDefect

### ** Examples

## generate an image without defects
img <- sarGen(m = 100, n = 100, border = 50)
image(img,col=gray(c(0:32)/32))

## superimpose a defect
img2 <- imposeDefect(img)
image(img2$img,col=gray(c(0:32)/32))



