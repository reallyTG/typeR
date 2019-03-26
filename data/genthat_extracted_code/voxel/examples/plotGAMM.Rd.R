library(voxel)


### Name: plotGAMM
### Title: GAMM plotting using ggplot2
### Aliases: plotGAMM

### ** Examples


set.seed(1)
data <- data.frame(x = (seq(.25,25, .25) +rnorm(100)), group = rep(1:2, 5), z=rnorm(100),
              index.rnorm = rep(rnorm(50, sd = 50), 2), index.var = rep(1:50, 2))
data$y <- (data$x)*data$group*10 + rnorm(100, sd = 700) + data$index.rnorm + data$z
data$group <- ordered(data$group)


gamm <- gamm4::gamm4(y ~ + s(x) + s(x, by=group) + z + group, data=data, random = ~ (1|index.var))


plot <- plotGAMM(gammFit <- gamm, smooth.cov <- "x", groupCovs = "group",
                    plotCI <- T, rawOrFitted = "raw", grouping = "index.var")

plot2 <- plotGAMM(gammFit <- gamm, smooth.cov <- "x", groupCovs = "group",
                  plotCI <- T, rawOrFitted = "fitted", grouping = "index.var")



