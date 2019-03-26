library(orloca)


### Name: as.matrix.loca.p
### Title: as.matrix.loca.p S3 method to convert from loca.p to matrix
### Aliases: as.matrix.loca.p

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Conversion to matrix
m <- as.matrix(loca)

# Show matrix
m

# Conversion from matrix
as.loca.p(m)



