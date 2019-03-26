library(spMC)


### Name: persp.multi_tpfit
### Title: Perspective Plots with Multidimensional Transiograms
### Aliases: persp.multi_tpfit
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)

# Estimate model parameter
x <- multi_tpfit(ACM$MAT5, ACM[, 1:3])

# Set short names for categories 3 and 4
names(x$prop)[3:4] <- c("Clay and Sand", "Gravel and Sand")

# 3D-Plot for a 2-D theoretical sections of
# a multidimensional transiogram
persp(x, 15, max.dist = c(200, 200, 20), which.dire = 2:3,
    mar = .7, col = rainbow(500), theta = 15, phi = 45)
## End(No test)


