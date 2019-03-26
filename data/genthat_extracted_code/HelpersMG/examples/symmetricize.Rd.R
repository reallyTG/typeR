library(HelpersMG)


### Name: symmetricize
### Title: Make a matrix symmetric
### Aliases: symmetricize

### ** Examples

#Create a sample 3x3 matrix
mat <- matrix(1:9, ncol=3)

#Copy the upper diagonal portion to the lower
symmetricize(mat, "ud")

#Take the average of each symmetric location
symmetricize(mat, "avg")




