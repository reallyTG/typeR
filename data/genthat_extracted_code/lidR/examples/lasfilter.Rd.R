library(lidR)


### Name: lasfilter
### Title: Return points with matching conditions
### Aliases: lasfilter

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

# Select the first returns classified as ground
firstground = lasfilter(lidar, Classification == 1 & ReturnNumber == 1)

# Multiple arguments are equivalent to &
firstground = lasfilter(lidar, Classification == 1, ReturnNumber == 1)

# Multiple criteria
first_or_ground = lasfilter(lidar, Classification == 1 | ReturnNumber == 1)



