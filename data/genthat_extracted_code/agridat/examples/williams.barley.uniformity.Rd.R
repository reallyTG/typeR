library(agridat)


### Name: williams.barley.uniformity
### Title: Uniformity trial of barley
### Aliases: williams.barley.uniformity
### Keywords: datasets

### ** Examples


data(williams.barley.uniformity)
dat <- williams.barley.uniformity

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          aspect= 75/36, # true aspect
          main="williams.barley.uniformity")
}


# Smoothed contour/persp plot like Williams Fig 1b, 2b
require("lattice")
dat$fit <- fitted(loess(yield~col*row, dat, span=.1))
contourplot(fit~col*row, data=dat,
            aspect=75/36, region=TRUE, col.regions=RedGrayBlue,
            main="williams.barley.uniformity")
wireframe(fit~col*row, data=dat, zlim=c(100, 350),
          main="williams.barley.uniformity")

# Williams table 1
anova(aov(yield ~ factor(row) + factor(col), dat))




