library(pavo)


### Name: vol
### Title: Plot a tetrahedral color space
### Aliases: vol

### ** Examples


# For plotting
data(sicalis)
vis.sicalis <- vismodel(sicalis, visual = "avg.uv")
tcs.sicalis <- colspace(vis.sicalis, space = "tcs")
plot(tcs.sicalis)
vol(tcs.sicalis)



