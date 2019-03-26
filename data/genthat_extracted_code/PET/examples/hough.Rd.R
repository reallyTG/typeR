library(PET)


### Name: hough
### Title: Hough Transformation
### Aliases: hough
### Keywords: math smooth

### ** Examples

P <- phantom()
hP <- hough(P)
viewData(list(P, hP$hData), list("Phantom", "Hough transformed phantom"))
rm(P,hP)



