library(ddalpha)


### Name: depth.space.potential
### Title: Calculate Potential Space
### Aliases: depth.space.potential
### Keywords: robust multivariate nonparametric

### ** Examples


# Generate a bivariate normal location-shift classification task
# containing 20 training objects
class1 <- mvrnorm(50, c(0,0), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
class2 <- mvrnorm(50, c(1,1), 
                  matrix(c(1,1,1,4), nrow = 2, ncol = 2, byrow = TRUE))
data <- rbind(class1, class2)
plot(data, col = c(rep(1,50), rep(2,50)))
# potential with rule of thumb bandwidth
ds = depth.space.potential(data, c(50, 50))
# draw.ddplot(depth.space = ds, cardinalities = c(50, 50))

# potential with bandwidth = 0.5 and joint scaling
ds = depth.space.potential(data, c(50, 50), kernel.bandwidth = 0.5,
                           pretransform = "1Mom")
# draw.ddplot(depth.space = ds, cardinalities = c(50, 50))

# potential with bandwidth = 0.5 and separate scaling
ds = depth.space.potential(data, c(50, 50), kernel.bandwidth = 0.5, 
                           pretransform = "NahMom") # or without pretransform
# draw.ddplot(depth.space = ds, cardinalities = c(50, 50))

data <- getdata("hemophilia")
cardinalities = c(sum(data$gr == "normal"), sum(data$gr == "carrier"))
ds = depth.space.potential(data[,1:2], cardinalities)
# draw.ddplot(depth.space = ds, cardinalities = cardinalities)




