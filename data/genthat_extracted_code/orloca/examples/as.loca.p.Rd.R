library(orloca)


### Name: as.loca.p
### Title: as.loca.p The following is for S3 compatibility, mainly for
###   documentation check
### Aliases: as.loca.p

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Conversion to matrix
m <- as.matrix(loca)

# Show matrix
m

# Conversion from matrix
as.loca.p(m)



