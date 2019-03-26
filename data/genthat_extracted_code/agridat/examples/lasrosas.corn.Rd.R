library(agridat)


### Name: lasrosas.corn
### Title: Yield monitor data for a corn field in Argentina with variable
###   nitrogen.
### Aliases: lasrosas.corn
### Keywords: datasets

### ** Examples


data(lasrosas.corn)
dat <- lasrosas.corn

# yield map
require(lattice)
if(require(latticeExtra)){  # for panel.levelplot.points
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  levelplot(yield ~ long*lat|factor(year), data=dat, 
            main="lasrosas.corn grain yield", xlab="Longitude", ylab="Latitude",
            scales=list(alternating=FALSE),
            prepanel = prepanel.default.xyplot,
            panel = panel.levelplot.points,
            type = c("p", "g"), aspect = "iso", col.regions=redblue)
}

d1 <- subset(dat, year==1999)

# Experiment design
xyplot(lat~long, data=d1, col=as.numeric(as.factor(d1$nitro)), pch=d1$topo,
       main="lasrosas.corn experiment layout 1999")

# A quadratic response to nitrogen is suggested
xyplot(yield~nitro|topo, data=d1, type=c('p','smooth'), layout=c(4,1),
       main="lasrosas.corn yield by topographic zone 1999")

# Full-field quadratic response to nitrogen.  Similar to Bongiovanni 2000,
# table 1.
m1 <- lm(yield ~ 1 + nitro + I(nitro^2), data=d1, subset=year==1999)
coef(m1)




