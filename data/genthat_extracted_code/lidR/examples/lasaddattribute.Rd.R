library(lidR)


### Name: lasaddattribute
### Title: Add attributes into a LAS object
### Aliases: lasaddattribute lasadddata lasaddextrabytes
###   lasaddextrabytes_manual lasremoveextrabytes

### ** Examples

LASfile <- system.file("extdata", "example.laz", package="rlas")
las <- readLAS(LASfile, select = "xyz")

print(las)
print(las@header)

x <- 1:30

las <- lasadddata(las, x, "mydata")
print(las)        # The las object has a new attribute called "mydata"
print(las@header) # But the header has not been updated. This new data will not be written

las <- lasaddextrabytes(las, x, "mydata2", "A new data")
print(las)        # The las object has a new attribute called "mydata2"
print(las@header) # The header has been updated. This new data will be written

# Optionally if the data is already in the LAS object you can update the header skipping the
# parameter x
las <- lasaddextrabytes(las, name = "mydata", desc = "Amplitude")
print(las@header)

# Remove an extra bytes attribute
las <- lasremoveextrabytes(las, "mydata2")
print(las)
print(las@header)

las <- lasremoveextrabytes(las, "mydata")
print(las)
print(las@header)



