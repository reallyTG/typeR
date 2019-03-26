library(orloca)


### Name: as-methods
### Title: as-methods
### Aliases: as-methods as.data.frame as.matrix as.loca.p,data.frame-method
###   as.loca.p,matrix-method
### Keywords: classes methods

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Conversion to matrix
m <- as.matrix(loca)

# Show matrix
m

# Conversion from matrix
as.loca.p(m)



