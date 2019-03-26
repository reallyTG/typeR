library(wiqid)


### Name: densityFolded
### Title: Folded kernel density estimation
### Aliases: densityFolded

### ** Examples

require(graphics)
par(mfrow=2:1)

x1 <- rnorm(1e4)            # no constraint on x1
plot(density(x1))
plot(densityFolded(x1))     # no difference

x2 <- abs(rnorm(1e4))       # x2 >= 0, with mode at 0
plot(density(x2))           # density > 0 when x2 < 0, mode around 0.2
abline(v=0, col='grey')
plot(densityFolded(x2))     # mode plotted correctly
abline(v=0, col='grey')

x3 <- rbeta(1e4, 1.5, 1.5)  # 0 <= x3 <= 1
plot(density(x3))           # density > 0 when x2 < 0 and x2 > 1
abline(v=0:1, col='grey')
plot(densityFolded(x3))
abline(v=0:1, col='grey')

x4 <- rbeta(1e4, 1.5, 0.9)  # 0 <= x4 <= 1, with mode at 1
plot(density(x4))           # mode appears to be around 0.95
abline(v=0:1, col='grey')
plot(densityFolded(x4))     # mode plotted correctly
abline(v=0:1, col='grey')

par(mfrow=c(1,1))



