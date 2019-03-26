library(candisc)


### Name: Wine
### Title: Chemical composition of three cultivars of wine
### Aliases: Wine
### Keywords: datasets

### ** Examples

data(Wine)
str(Wine)
#summary(Wine)

Wine.mlm <- lm(as.matrix(Wine[, -1]) ~ Cultivar, data=Wine)
Wine.can <- candisc(Wine.mlm)
Wine.can


plot(Wine.can, ellipse=TRUE)
plot(Wine.can, which=1)





