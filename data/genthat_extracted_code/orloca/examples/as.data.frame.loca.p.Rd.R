library(orloca)


### Name: as.data.frame.loca.p
### Title: as.data.frame.loca.p S3 method to convert from loca.p to
###   data.frame
### Aliases: as.data.frame.loca.p

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Conversion to matrix
m <- as.matrix(loca)

# Show matrix
m

# Conversion from matrix
as.loca.p(m)



