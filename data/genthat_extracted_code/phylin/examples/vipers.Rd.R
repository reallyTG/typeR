library(phylin)


### Name: vipers
### Title: Vipers sample locations for 'd.gen' dataset.
### Aliases: vipers
### Keywords: datasets

### ** Examples

data(vipers)
data(grid)
plot(grid, cex=0.5, col='lightgrey', asp=1,
     main="Vipers data", xlab="Longitude", ylab="Latitude")
points(vipers[,1:2], pch=vipers$lin)
legend(1, 38, legend=c("West", "South", "East"), pch=1:3, title="Lineages")




