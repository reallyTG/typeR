library(sharpshootR)


### Name: CDECquery
### Title: Get water-related data (California only) from the CDEC website.
### Aliases: CDECquery

### ** Examples

## Not run: 
##D library(latticeExtra)
##D library(plyr)
##D library(e1071)
##D 
##D # get daily resevoir storage (ac. ft) from Pinecrest, New Melones and Lyons resevoirs
##D pinecrest <- CDECquery(id='swb', sensor=15, interval='D', start='2012-09-01', end='2015-01-01')
##D new.melones <- CDECquery(id='nml', sensor=15, interval='D', start='2012-09-01', end='2015-01-01')
##D lyons <- CDECquery(id='lys', sensor=15, interval='D', start='2012-09-01', end='2015-01-01')
##D 
##D # compute storage capacity
##D pinecrest$capacity <- pinecrest$value / 18312 * 100
##D new.melones$capacity <- new.melones$value / 2400000 * 100
##D lyons$capacity <- lyons$value / 6228 * 100
##D 
##D # combine
##D g <- make.groups(new.melones, lyons, pinecrest)
##D 
##D # resonable date scale
##D r <- range(g$datetime)
##D s.r <- seq(from=r[1], to=r[2], by='1 month')
##D 
##D # better colors
##D tps <- list(superpose.line=list(lwd=2, col=brewer.pal(n=3, name='Set1')))
##D 
##D # plot
##D xyplot(capacity ~ datetime, groups=which, data=g, type='l', 
##D        xlab='', ylab='Capacity (##D 
##D        scales=list(x=list(at=s.r, labels=format(s.r, "##D 
##D        auto.key=list(columns=3, lines=TRUE, points=FALSE),
##D        par.settings=tps,
##D        panel=function(...) {
##D          panel.abline(h=seq(0, 100, by=10), col='grey')
##D          panel.abline(v=s.r, col='grey')
##D          panel.xyplot(...)
##D        })
##D 
##D 
##D ##
##D # New Melones monthly data, retrieve as far back in time as possible 
##D new.melones.monthly <- CDECquery(id='nml', sensor=15, interval='M', 
##D start='1900-01-01', end='2015-01-01')
##D 
##D # convert to pct. capacity
##D new.melones.monthly$capacity <- new.melones.monthly$value / 2400000 * 100
##D 
##D 
##D # make a nice color ramp function
##D cols <- colorRampPalette(brewer.pal(9, 'Spectral'), 
##D space='Lab', interpolate='spline')
##D 
##D # plot, each pixel is colored by the total precip by year/month
##D levelplot(capacity ~ year * month, data=new.melones.monthly, col.regions=cols, xlab='', 
##D ylab='', scales=list(x=list(tick.number=20)), main='New Melones Capacity (##D 
##D 
##D 
##D ##
##D # get daily precip totals from Stan Powerhouse
##D x <- CDECquery(id='spw', sensor=45, interval='D', start='1900-01-01', end='2015-01-01')
##D 
##D # compute total precip by year/month
##D a <- ddply(x, c('year', 'month'), summarize, s=sum(value, na.rm=TRUE))
##D 
##D # convert monthly precipitation values into Z-scores by month
##D a.scaled <- ddply(a, 'month', summarize, year=year, scaled.ppt=scale(s))
##D 
##D # make a nice color ramp function, scaled by the skewness of the underlying distribution
##D cols <- colorRampPalette(brewer.pal(9, 'Spectral'), 
##D space='Lab', interpolate='spline', bias=skewness(a.scaled$scaled.ppt, na.rm=TRUE))
##D 
##D # plot, each pixel is colored by the total precip by year/month
##D levelplot(scaled.ppt ~ year * month, data=a.scaled, col.regions=cols, xlab='', 
##D ylab='', scales=list(x=list(tick.number=10)), 
##D main='Monthly Total Precipitation (as z-score) SPW')
##D 
##D 
##D ##
##D # get pre-aggregated monthly data from Sonora RS
##D x <- CDECquery(id='sor', sensor=2, interval='M', start='1900-01-01', end='2015-01-01')
##D 
##D # make a nice color ramp function, scaled by the skewness of the underlying distribution
##D cols <- colorRampPalette(brewer.pal(9, 'Spectral'), space='Lab', 
##D interpolate='spline', bias=skewness(x$value, na.rm=TRUE))
##D 
##D # plot
##D levelplot(value ~ year * month, data=x, col.regions=cols, xlab='', 
##D ylab='', scales=list(x=list(tick.number=20)), main='Monthly Total Precipitation (inches) SOR')
##D 
##D 
##D ### query an 'event' type sensor
##D # Bryte test site (BYT)
##D # air temperature and soil temperature at depth 1 (25cm)
##D # measurement interval is 20 minutes
##D x.air <- CDECquery('BYT', 4, 'E', '2016-01-01', '2017-01-01')
##D x.soil.25 <- CDECquery('BYT', 194, 'E', '2016-01-01', '2017-01-01')
##D 
##D # combine
##D g <- make.groups(air=x.air, soil.25=x.soil.25)
##D 
##D xyplot(value ~ datetime, groups=which, data=g, type=c('g', 'l'),
##D auto.key=list(columns=2, points=FALSE, lines=TRUE))
## End(Not run)



