library(mclust)


### Name: predict.Mclust
### Title: Cluster multivariate observations by Gaussian finite mixture
###   modeling
### Aliases: predict.Mclust
### Keywords: multivariate

### ** Examples

model <- Mclust(faithful)

# predict cluster for the observed data
pred <- predict(model) 
str(pred)
pred$z              # equal to model$z
pred$classification # equal to 
plot(faithful, col = pred$classification, pch = pred$classification)

# predict cluster over a grid
grid <- apply(faithful, 2, function(x) seq(min(x), max(x), length = 50))
grid <- expand.grid(eruptions = grid[,1], waiting = grid[,2])
pred <- predict(model, grid)
plot(grid, col = mclust.options("classPlotColors")[pred$classification], pch = 15, cex = 0.5)
points(faithful, pch = model$classification)



