library(nlrx)


### Name: nl_to_points
### Title: Get spatial data from metrics.turtles output
### Aliases: nl_to_points

### ** Examples


# Load nl object (with spatial output data already attached) from test data:
nl <- nl_spatial

# Convert turtle metrics (pxcor/pycor) to spatial point objects:
results.sf <- nl_to_points(nl, coords="px")





