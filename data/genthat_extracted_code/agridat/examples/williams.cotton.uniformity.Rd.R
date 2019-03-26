library(agridat)


### Name: williams.cotton.uniformity
### Title: Uniformity trial of cotton
### Aliases: williams.cotton.uniformity
### Keywords: datasets

### ** Examples


data(williams.cotton.uniformity)
dat <- williams.cotton.uniformity

if(require(desplot)){
desplot(yield ~ col*row, dat,
        aspect=144/24, # true aspect
        main="williams.cotton.uniformity")
}


# Smoothed contour/persp plot like Williams 1988 Fig 1a, 2a
dat$fit <- fitted(loess(yield~col*row, dat, span=.5))
require("lattice")
contourplot(fit~col*row, data=dat,
            aspect=144/24,
            region=TRUE, cuts=6, col.regions=RedGrayBlue,
            main="williams.cotton.uniformity")
# wireframe(fit~col*row, data=dat, zlim=c(100, 250),
#           main="williams.cotton.uniformity")

# Williams table 1
anova(aov(yield ~ factor(row) + factor(col), dat))



