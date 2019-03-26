library(sfsmisc)


### Name: sessionInfoX
### Title: Extended Information About the Current R Session
### Aliases: sessionInfoX print.sessionInfoX
### Keywords: misc

### ** Examples

six0 <- sessionInfoX()
sixN <- sessionInfoX("nlme", list.libP = TRUE)
sixN # -> print() method for "sessionInfoX"
names(sixN)
str(sixN, max = 1)# outline of lower-level structure
str(sixN$pkgDescr) # list with one component "nlme"



