library(CAinterprTools)


### Name: groupBycoord
### Title: Define groups of categories on the basis of a selected partition
###   into k groups employing the Jenks' natural break method on the
###   selected dimension's coordinates
### Aliases: groupBycoord
### Keywords: groupBycoord

### ** Examples

data(greenacre_data)

#divide the row categories into 3 groups on the basis of the coordinates
#of the 1st dimension, and store the result into a 'res' object
res <- groupBycoord(greenacre_data, x=1, k=3, which="rows")




