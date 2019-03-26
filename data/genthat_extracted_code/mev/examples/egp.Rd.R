library(mev)


### Name: egp
### Title: Extended generalised Pareto families
### Aliases: egp

### ** Examples

set.seed(123)
xdat <- evd::rgpd(1000, loc=0, scale=1, shape=0.5)
par <- egp.fit(xdat, thresh=0, model="egp3")$par
p <- c(1/1000,1/1500,1/2000)
egp.retlev(xdat, 0, par, "egp3",p)
#With multiple thresholds
th <- c(0,0.1,0.2,1)
opt <- egp.fitrange(xdat, th, model="egp1",plots=NA)
egp.retlev(xdat, opt$thresh, opt$par, "egp1",p=p)
opt <- egp.fitrange(xdat, th, model="egp2",plots=NA)
egp.retlev(xdat, opt$thresh, opt$par, "egp2",p=p)
opt <- egp.fitrange(xdat, th, model="egp3",plots=NA)
egp.retlev(xdat, opt$thresh, opt$par, "egp3",p=p)



