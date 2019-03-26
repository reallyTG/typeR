library(agridat)


### Name: kreusler.maize
### Title: Growth of maize plants in Germany during 1875-1878
### Aliases: kreusler.maize
### Keywords: datasets

### ** Examples


data(kreusler.maize)
dat <- kreusler.maize
dat$date2 <- as.Date(dat$date,"%d %b %Y")
dat$doy <- as.numeric(strftime(dat$date2, format="%j"))

# Hunt & Evans Fig 2a
library(lattice)
xyplot(log10(plantweight)~doy|factor(year), data=dat, group=gen,
       type=c('p','smooth'), span=.4, as.table=TRUE, 
       xlab="Day of year", main="kreusler.maize - growth of maize",
       auto.key=list(columns=5))

## Not run: 
##D 
##D # Hunt & Evans Fig 2b
##D xyplot(log10(plantweight)~doy|gen, data=dat, group=factor(year),
##D        type=c('p','smooth'), span=.5, as.table=TRUE, 
##D        xlab="Day of year",
##D        auto.key=list(columns=4))
##D # Hunt & Evans Fig 3a
##D xyplot(log10(leafarea)~doy|factor(year), data=dat, group=gen,
##D        type=c('p','smooth'), span=.5, as.table=TRUE, 
##D        xlab="Day of year",
##D        auto.key=list(columns=5))
##D # Hunt & Evans Fig 3a
##D xyplot(log10(leafarea)~doy|gen, data=dat, group=factor(year),
##D        type=c('p','smooth'), span=.5, as.table=TRUE, 
##D        xlab="Day of year",
##D        auto.key=list(columns=4))
##D 
##D # All traits
##D   
##D xyplot(raindays~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(rain~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(temp~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(parentseed~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(roots~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(leaves~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(stem~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(grain~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(plantweight~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(plantheight~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(leafcount~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(leafarea~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
##D xyplot(tassel~doy|factor(year), data=dat, group=gen,
##D        type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
## End(Not run)




