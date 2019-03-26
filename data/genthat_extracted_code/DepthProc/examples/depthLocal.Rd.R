library(DepthProc)


### Name: depthLocal
### Title: Local depth
### Aliases: depthLocal

### ** Examples


## Not run: 
##D # EXAMPLE 1
##D data <- mvrnorm(100, c(0, 5), diag(2) * 5)
##D # By default depth_params2 = depth_params1
##D depthLocal(data, data, depth_params1 = list(method = "LP"))
##D depthLocal(data, data, depth_params1 = list(method = "LP"),
##D            depth_params2 = list(method = "Projection"))
##D # Depth contour
##D depthContour(data, depth_params = list(method = "Local", depth_params1 = list(method = "LP")))
##D 
##D # EXAMPLE 2
##D data(inf.mort, maesles.imm)
##D data1990 <- na.omit(cbind(inf.mort[, 1], maesles.imm[, 1]))
##D depthContour(data1990,
##D              depth_params = list(
##D                method = "Local",
##D                depth_params1 = list(method = "LP"),
##D                beta = 0.3
##D              ))
##D 
##D # EXAMPLE 3
##D Sigma1 <- matrix(c(10, 3, 3, 2), 2, 2)
##D X1 <- mvrnorm(n = 8500, mu = c(0, 0), Sigma1)
##D Sigma2 <- matrix(c(10, 0, 0, 2), 2, 2)
##D X2 <- mvrnorm(n = 1500, mu = c(-10, 6), Sigma2)
##D BALLOT <- rbind(X1, X2)
##D 
##D train <- sample(1:10000, 100)
##D data <- BALLOT[train, ]
##D depthContour(data,
##D             depth_params = list(
##D               method = "Local",
##D               beta = 0.3,
##D               depth_params1 = list(method = "Projection")
##D             ))
## End(Not run)




