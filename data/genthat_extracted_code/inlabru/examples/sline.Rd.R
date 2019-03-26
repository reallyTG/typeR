library(inlabru)


### Name: sline
### Title: Convert data frame to SpatialLinesDataFrame
### Aliases: sline

### ** Examples


## No test: 
# Create a data frame defining three lines 
lns = data.frame(xs = c(1,2,3), ys = c(1,1,1), # start points
                 xe = c(2,3,4), ye = c(2,2,2)) # end points


# Conversion to SpatialLinesDataFrame without CRS
spl = sline(lns, start.cols = c("xs","ys"), 
            end.cols = c("xe","ye"))

# Plot the lines
ggplot() + gg(spl)
## End(No test)



