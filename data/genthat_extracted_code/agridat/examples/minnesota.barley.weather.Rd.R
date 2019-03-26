library(agridat)


### Name: minnesota.barley.weather
### Title: Monthly weather at 6 sites in Minnesota 1927-1936.
### Aliases: minnesota.barley.weather
### Keywords: datasets

### ** Examples


data(minnesota.barley.yield)
dat <- minnesota.barley.yield
data( minnesota.barley.weather)
datw <- minnesota.barley.weather

# Weather trends over time
if(require(latticeExtra)){
  useOuterStrips(xyplot(cdd~mo|year*site, datw, groups=year,
                        main="minnesota.barley",
                        xlab="month", ylab="Cooling degree days",
                        subset=(mo > 3 & mo < 10),
                        scales=list(alternating=FALSE),
                        type='l', auto.key=list(columns=5)))
}

# Total cooling/heating/precip in Apr-Aug for each site/yr
ww <- subset(datw, mo>=4 & mo<=8)
ww <- aggregate(cbind(cdd,hdd,precip)~site+year, data=ww, sum)

# Average yield per each site/env
yy <- aggregate(yield~site+year, dat, mean)

minn <- merge(ww, yy)


# Higher yields generally associated with cooler temps, more precip
if(require(reshape2)){
me <- melt(minn, id.var=c('site','year'))
mey <- subset(me, variable=="yield")
mey <- mey[,c('site','year','value')]
names(mey) <- c('site','year','y')
mec <- subset(me, variable!="yield")
names(mec) <- c('site','year','covar','x')
mecy <- merge(mec, mey)
mecy$yr <- factor(mecy$year)
oldpar <- tpg <- trellis.par.get()
tpg$superpose.symbol$pch <- substring(levels(mecy$yr),4) # Last digit of year
trellis.par.set(tpg)
foo <- xyplot(y~x|covar*site, data=mecy, groups=yr, cex=1, ylim=c(5,65),
              xlab="", ylab="yield", main="minnesota.barley",
              panel=function(x,y,...) {
                panel.lmline(x,y,..., col="gray")
                panel.superpose(x,y,...)
              },
              scales=list(x=list(relation="free")))
if(require(latticeExtra)){
  foo <- useOuterStrips(foo, strip.left = strip.custom(par.strip.text=list(cex=.7)))
  combineLimits(foo, margin.x=2L) # Use a common x axis for all rows
} 
} # reshape2




