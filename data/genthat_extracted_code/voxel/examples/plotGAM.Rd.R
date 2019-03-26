library(voxel)


### Name: plotGAM
### Title: GAM plotting using ggplot2
### Aliases: plotGAM

### ** Examples


data <- data.frame(x = rep(1:20, 2), group = rep(1:2, each = 20))
set.seed(1)
data$y <- (data$x^2)*data$group*3 + rnorm(40, sd = 200)
data$group <- ordered(data$group)

gam <- mgcv::gam(y ~ s(x) + group, data=data)

plot1 <- plotGAM(gamFit = gam, smooth.cov = "x", groupCovs = NULL,
                  rawOrFitted = "raw", plotCI=TRUE, orderedAsFactor = FALSE)
gam <- mgcv::gam(y ~ s(x) + group + s(x, by=group), data=data)
plot2 <- plotGAM(gamFit = gam, smooth.cov = "x", groupCovs = "group",
                             rawOrFitted = "raw", orderedAsFactor = FALSE)



