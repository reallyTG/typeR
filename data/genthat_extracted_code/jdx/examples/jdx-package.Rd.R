library(jdx)


### Name: jdx-package
### Title: Java Data Exchange for R and rJava
### Aliases: jdx-package jdx
### Keywords: package programming interface

### ** Examples

library("jdx")

# Convert matrix using column-major ordering
m <- matrix(1:4, 2, 2)
o = convertToJava(m, array.order = "column-major")
getJavaClassName(o)
identical(m, convertToR(o, array.order = "column-major"))

# Convert 4-dimensional array using row-major ordering
dimensions <- c(3, 2, 2, 2)
a = array(1:prod(dimensions), dimensions)
o = convertToJava(a, array.order = "row-major")
getJavaClassName(o)
identical(a, convertToR(o, array.order = "row-major"))

# Convert data frame
identical(iris, convertToR(convertToJava(iris)))

# Demonstrate exact double precision
identical(pi, convertToR(convertToJava(pi, scalars.as.objects = TRUE)))



