library(ddalpha)


### Name: draw.ddplot
### Title: Draw _DD_-Plot
### Aliases: draw.ddplot
### Keywords: visualization

### ** Examples

  data = getdata("kidney")
  
  #1. using the existing ddalpha classifier
  ddalpha = ddalpha.train(data, depth = "spatial")
  draw.ddplot(ddalpha, main = "DD-plot")
  
  #2. using depth.space.
  # Sort the data w.r.t. classes
  data = rbind(data[data$C == 1,], data[data$C == 2,])
  cardinalities = c(sum(data$C == 1), sum(data$C == 2))
  
  dspace = depth.space.spatial(data[,-6], cardinalities = cardinalities)
  draw.ddplot(depth.space = dspace, cardinalities = cardinalities, 
              main = "DD-plot", xlab = 1, ylab = 2)



