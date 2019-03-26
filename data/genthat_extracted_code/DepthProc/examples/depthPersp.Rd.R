library(DepthProc)


### Name: depthPersp
### Title: Perspective plot for depth functions
### Aliases: depthPersp

### ** Examples

# EXAMPLE 1
x <- mvrnorm(100, c(0, 0), diag(2))
depthPersp(x, depth_params = list(method = "Euclidean"))

# EXAMPLE 2
data(inf.mort, maesles.imm)
data1990 <- na.omit(cbind(inf.mort[, 1], maesles.imm[, 1]))

## Not run: 
##D library(rgl)
##D depthPersp(data1990, plot_method = "rgl",
##D            depth_params = list(method = "Projection"))
## End(Not run)




