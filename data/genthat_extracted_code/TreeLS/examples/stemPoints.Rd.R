library(TreeLS)


### Name: stemPoints
### Title: Stem points classification
### Aliases: stemPoints

### ** Examples

### single tree
file = system.file("extdata", "pine.laz", package="TreeLS")
tls = readTLS(file)
tls = stemPoints(tls)
plot(tls, color='Stem')

### forest plot - check the example given for the stem segmentation function
?stemSegmentation




