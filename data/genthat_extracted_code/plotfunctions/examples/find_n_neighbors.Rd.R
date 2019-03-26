library(plotfunctions)


### Name: find_n_neighbors
### Title: Return n neighbors around given indices.
### Aliases: find_n_neighbors

### ** Examples

vectorIndices <- 1:1000
indOutliers <- c(2,10, 473, 359, 717, 519)
fn3 <- find_n_neighbors(indOutliers, n=3, max=max(vectorIndices))
fn20 <- find_n_neighbors(indOutliers, n=20, max=max(vectorIndices))

# check fn3:
print(fn3)

# Plot:
emptyPlot(c(-10,1000), c(-1,1), h0=0, v0=indOutliers)
points(fn3, rep(.5, length(fn3)), pch='*')
points(fn20, rep(-.5, length(fn20)), pch='*')



