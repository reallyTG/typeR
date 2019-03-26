library(lisrelToR)


### Name: readLisrel
### Title: Read LISREL matrices into R
### Aliases: readLisrel

### ** Examples

## Measurment invariance example:
download.file("http://sachaepskamp.com/files/mi1.OUT",modFile <- tempfile(fileext=".OUT"))
Lis <- readLisrel(modFile)

# Extract Lambda-Y for group 2:
lisrelMatrix(Lis,"LY", group = 2)

# Structure of object:
str(Lis)

# Print full LISREL output to console:
print(Lis)



