## ---- echo = F-----------------------------------------------------------
knitr::opts_chunk$set(fig.width = 4.5, fig.height = 4.5, fig.align='center')

## ------------------------------------------------------------------------
library(skyscapeR)

## ------------------------------------------------------------------------
data(RugglesRSC)
curv <- curvigram(RugglesRSC$Dec, 2)

## ---- fig.show='hold'----------------------------------------------------
plotCurv(curv)

## ------------------------------------------------------------------------
lunar <- sky.objects('moon', epoch=-2000, col='red', lty=2)

## ---- fig.show='hold'----------------------------------------------------
plotCurv(curv, lunar)

## ------------------------------------------------------------------------
georef <- rbind(c(35.1,-7.1),c(35.1,-7),c(35.2,-7.1),c(35.1,-7.3))    # GPS data
azimuths <- c(93, 108, 105, 98)    # Compass measurements
altitudes <- c(2, 1.5, 0.5, 1)    # Clinometer measurements

data <- reduct.compass(loc=georef, mag.az=azimuths, date="2017/06/13", alt=altitudes)
data

## ------------------------------------------------------------------------
data2 <- reduct.compass(loc=georef, mag.az=azimuths, date="2017/06/13")
data2

## ------------------------------------------------------------------------
georef <- c( ten(35,50,37.8), ten(14,34,6.4) )    # GPS data
az <- c( ten(298,24,10), ten(302,20,40))    # Theodolite H measurements
alt <- c( ten(1,32,10), ten(0,2,27))    # Theodolite V measurements
az.sun <- ten(327,29,50)    # The azimuth of the sun as measured at time
date <- "2016/02/20"
time <- "11:07:17"    # Time the sun measurement was taken
timezone <- "Europe/Malta"    # Timezone corresponding to time above

data <- reduct.theodolite(loc=georef, az, date, time, timezone, az.sun, alt)
data

## ---- fig.show='hold'----------------------------------------------------
az <- rnorm(30, 85, 20)    # This creates 30 random azimuths
plotAz(az)

## ---- fig.show='hold'----------------------------------------------------
sunandmoon <- sky.objects(c('sun','moon'), epoch=-4000, col=c('blue','red'), lty=c(2,3))
plotAz(az, obj=sunandmoon, loc=c(52,0))

## ------------------------------------------------------------------------
dec <- az2dec(az, loc= c(35,-7), alt=0)
dec

## ------------------------------------------------------------------------
az <- c(0,90,180,270,360)
alt <- c(0,5,5,0,0)
georef = c(40.1, -8)
hor <- createHor(az, alt, loc=georef, name= 'Horizon Profile 1')

## ---- fig.width = 7, fig.height = 4--------------------------------------
plotHor(hor)

## ---- fig.width = 7, fig.height = 4--------------------------------------
hor <- download.HWT('NML6GMSX')
plotHor(hor)

## ------------------------------------------------------------------------
hor2alt(hor, az=90)
hor2alt(hor, az=110)

## ------------------------------------------------------------------------
data <- reduct.compass(loc=hor, mag.az=azimuths, date="2017/06/13")
data

## ---- fig.width = 7, fig.height = 4--------------------------------------
plotHor(hor, obj=lunar)

## ---- fig.width = 7, fig.height = 4--------------------------------------
aux <- sky.objects(names=c('sun', 'Aldebaran'), epoch=c(-4300,-3700), col=c('blue', 'red'))
plotHor(hor, obj=aux)

## ------------------------------------------------------------------------
ss <- star('Sirius')
ss

## ------------------------------------------------------------------------
ss <- star('Sirius', year=-4000)
ss$dec

## ------------------------------------------------------------------------
sp <- star.phases('Sirius', -3000, loc=c(30.0,31.2), alt.hor=2, ncores=2)  
# Number of cores forced to 2 for production of vignette only

## ------------------------------------------------------------------------
sp$phase
sp$events
sp$seasons

## ---- fig.show='hold', fig.width = 5, fig.height = 1---------------------
plotPhases(sp)

## ------------------------------------------------------------------------
nullhyp <- nh.Uniform(c(57,2), alt=0)

## ------------------------------------------------------------------------
sg <- sigTest(curv, nullhyp, ncores=2)   
# Number of cores forced to 2 for production of vignette only

## ---- fig.show='hold'----------------------------------------------------
plotCurv(curv,signif=sg)

## ---- fig.show='hold'----------------------------------------------------
plotZscore(sg, lunar)

## ------------------------------------------------------------------------
sg$p.value
sg$maxima

