library(gratia)


### Name: datagen
### Title: Generate data over the range of variables used in smooths
### Aliases: datagen datagen.mgcv.smooth datagen.fs.interaction datagen.gam
###   datagen.gamm

### ** Examples

library("mgcv")

## 1d example
set.seed(2)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")
df <- datagen(m1)
head(df)

## 2d example
dat <- gamSim(2, n = 400, dist = "normal", scale = 2)
m2 <- gam(y ~ s(x, z), data = dat$data, method = "REML")
df <- datagen(m2)
head(df)
## alternative showing using the mgcv.smooth method for a single smooth
df2 <- datagen(m2[["smooth"]][[1L]], data = dat$data)
head(df2)



