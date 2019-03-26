library(sparkTable)


### Name: optimal_grid_allocation
### Title: Optimal Allocation of Coordinates to a grid
### Aliases: optimal_grid_allocation

### ** Examples

  data <- data.frame(x=c(0,2,1.24,2,1.98,1.62,1.24,1.91,0.48),
    y=c(2.93,2.45,1.94,1.46,0.98,3,0.70,0.56,0))
rownames(data) <- c("IS","FI","NO","EE","LV","SE","DK","LT","IE")
index <-  optimal_grid_allocation(data,plot=TRUE)
index2 <- optimal_grid_allocation(data,grid.cols=3,grid.rows=4,plot=TRUE)



