library(secrlinear)


### Name: plotmethods
### Title: Plot Methods for linearmask and linearpopn objects
### Aliases: plot.linearpopn plot.linearmask
### Keywords: hplot

### ** Examples

x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
mask <- read.linearmask(data = xy, spacing = 10)
linpop <- sim.linearpopn(mask, 100)
plot(linpop, jitter = 2)

plot(mask)

## thicker band of grey points, dashed line
plot(mask, cex = 2, lty = 2)

## add a covariate, the distance downstream from the first mask point
downstrm <- networkdistance(glymemask, glymemask[1,], glymemask)[,1]
covariates(glymemask)<- data.frame(downstream = downstrm)

## point colour determined by a covariate
plot(glymemask, cex = 2, covariate = 'downstream', pt.cex = 2)

## point size determined by a covariate
plot(glymemask, cex = covariates(glymemask)$downstream/50, pch = 21)




