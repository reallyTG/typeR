library(orloca)


### Name: as.loca.p.matrix
### Title: as.loca.p.matrix S3 method to convert from matrix to loca.p
### Aliases: as.loca.p.matrix

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Conversion to matrix
m <- as.matrix(loca)

# Show matrix
m

# Conversion from matrix
as.loca.p(m)



