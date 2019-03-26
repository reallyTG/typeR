library(orloca)


### Name: as.loca.p.data.frame
### Title: as.loca.p.data.frame S3 method to convert from data.frame to
###   loca.p
### Aliases: as.loca.p.data.frame

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Conversion to matrix
m <- as.matrix(loca)

# Show matrix
m

# Conversion from matrix
as.loca.p(m)



