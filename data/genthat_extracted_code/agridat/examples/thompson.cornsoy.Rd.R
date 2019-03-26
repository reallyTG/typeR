library(agridat)


### Name: thompson.cornsoy
### Title: Multi-environment trial of corn & soybean, 1930-1962, with
###   temperature and precipitation
### Aliases: thompson.cornsoy

### ** Examples


data(thompson.cornsoy)
dat <- thompson.cornsoy

# The droughts of 1934/36 were severe in IA/MO. Less so in OH.
require(lattice)
xyplot(corn+soy~year|state, dat,
       type=c('p','l','r'), auto.key=list(columns=2),
       main="thompson.cornsoy",
       layout=c(5,1),ylab='yield')

# In 1954, only Missouri suffered very hot, dry weather
## xyplot(corn~year, dat,
##        groups=state, type=c('p','l'),
##        main="thompson.cornsoy",
##        auto.key=list(columns=5), ylab='corn yield')

# Rain and temperature have negative correlation in each month.
# July is a critical month: temp and yield are negatively correlated,
# while rain and yield are positively correlated.
# splom(~dat[-1,-1], col=dat$state, cex=.5, main="thompson.cornsoy")

## Not run: 
##D   # Plots similar to those in Venables' Exegeses paper.
##D 
##D   dat.ia <- subset(dat, state=="Iowa")
##D 
##D   require(splines)
##D   m2 <- aov(corn ~ ns(rain0, 3) + ns(rain7, 3) +
##D               ns(temp8, 3) + ns(year,3), dat.ia)
##D   op <- par(mfrow=c(2,2))
##D   termplot(m2, se=TRUE, rug=TRUE, partial=TRUE)
##D   par(op)
##D 
##D   # do NOT use gam package
##D   require(mgcv)
##D   m1 <- gam(corn ~ s(year, k=5) + s(rain0, k=5) +
##D               s(rain7, k=5) + s(temp8, k=5), data=dat.ia)
##D   op <- par(mfrow=c(2,2))
##D   plot.gam(m1, residuals=TRUE, se=TRUE, cex=2)
##D   par(op)
## End(Not run)




