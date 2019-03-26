library(marmap)


### Name: read.bathy
### Title: Read bathymetric data in XYZ format
### Aliases: read.bathy

### ** Examples

# load NW Atlantic data
data(nw.atlantic)

# write example file to disk
write.table(nw.atlantic, "NW_Atlantic.csv", sep=",", quote=FALSE, row.names=FALSE)

# use read.bathy
read.bathy("NW_Atlantic.csv", header=TRUE) -> atl

# remove temporary file
system("rm NW_Atlantic.csv") # remove file, for unix-like systems

# class "bathy"
class(atl)

# summarize data of class "bathy"
summary(atl)




