library(lisrelToR)


### Name: lisrelMatrix
### Title: Extract LISREL matrices from 'lisrel' object.
### Aliases: lisrelMatrix

### ** Examples

## Measurment invariance example:
download.file("http://sachaepskamp.com/files/mi1.OUT",modFile <- tempfile(fileext=".OUT"))
Lis <- readLisrel(modFile)

# Extract Lambda-Y for group 2:
lisrelMatrix(Lis,"LY", group = 2)



