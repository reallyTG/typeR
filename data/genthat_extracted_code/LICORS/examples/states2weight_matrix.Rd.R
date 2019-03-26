library(LICORS)


### Name: states2weight_matrix
### Title: Converts label vector to 0/1 mixture weight matrix
### Aliases: states2weight_matrix
### Keywords: array manip

### ** Examples

ss <- sample.int(5, 10, replace = TRUE)
WW <- states2weight_matrix(ss)

image2(WW, col = "RdBu", xlab = "States", ylab = "Samples", axes = FALSE)



