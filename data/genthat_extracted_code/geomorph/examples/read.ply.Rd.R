library(geomorph)


### Name: read.ply
### Title: Read mesh data (vertices and faces) from ply files
### Aliases: read.ply
### Keywords: IO

### ** Examples

# If the file has no mesh color, or color is undesirable, user can assign this as follows:
# Using the example scallop PLY
data(scallopPLY) 
myply <- scallopPLY$ply
myply$material <- "gray" # using color word
myply$material <- "#FCE6C9" # using RGB code



