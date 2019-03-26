library(genridge)


### Name: plot3d.ridge
### Title: 3D Ridge Trace Plots
### Aliases: plot3d plot3d.ridge plot3d.pcaridge
### Keywords: hplot

### ** Examples

lmod <- lm(Employed ~ GNP + Unemployed + Armed.Forces + Population + 
                      Year + GNP.deflator, data=longley)
longley.y <- longley[, "Employed"]
longley.X <- model.matrix(lmod)[,-1]

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lambdaf <- c("0", ".005", ".01", ".02", ".04", ".08")
lridge <- ridge(longley.y, longley.X, lambda=lambda)

## No test: 
plot3d(lridge, var=c(1,4,5), radius=0.5)

# view in SVD/PCA space
plridge <- pca.ridge(lridge)
plot3d(plridge, radius=0.5)
## End(No test)




