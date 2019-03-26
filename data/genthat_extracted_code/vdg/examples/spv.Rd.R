library(vdg)


### Name: spv
### Title: Calculate the Scaled Prediction Variance (or SPV)
### Aliases: spv spv.data.frame spv.list spv.matrix
### Keywords: multivariate

### ** Examples


# Single design (class 'spv')
library(rsm)
bbd3 <- as.data.frame(bbd(3)[,3:5])
colnames(bbd3) <- paste0("x", 1:3)
quad.3f <- formula(~(x1 + x2 + x3)^2 - x1:x2:x3)
out <- spv(n = 1000, design = bbd3, type = "spherical", formula = quad.3f)
out



