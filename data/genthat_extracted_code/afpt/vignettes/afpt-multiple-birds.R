## ------------------------------------------------------------------------
library(afpt)

## ------------------------------------------------------------------------
data(climbing_birds) #  Load climbing bird data set

climbing_birds <- climbing_birds#[seq(1,15,3),]
myBirds <- Bird(climbing_birds)

myBirds$coef.profileDragLiftFactor[myBirds$name=='Mute swan'] = 0 
# we have to assume that swans has specialized aerofoil, as it otherwise won't be able to fly
# this may be true for other birds too, and should be investigated further...

myBirds[c('name','massTotal','wingSpan','wingArea','wingbeatFrequency')]

## ------------------------------------------------------------------------
myBirds$powerAvailable <- computeAvailablePower(myBirds)
climbperf <- findMaximumClimbRate(myBirds,maximumPower = myBirds$powerAvailable,strokeplane=20)
climbperf[c('speed','climbRate','frequency','amplitude')]

## ------------------------------------------------------------------------
minpower <- findMinimumPowerSpeed(myBirds,strokeplane=20)
climbperf.trad <- data.frame( # compute traditional climb performance
  speed = minpower$speed,
  climbRate = (myBirds$powerAvailable-minpower$power)/myBirds$massTotal/9.81
)

climbperf[c('speed','climbRate')]/climbperf.trad # compare


## ------------------------------------------------------------------------
myBirds$climbSpeed <- climbing_birds$climbSpeed # attach observed climb speeds to the bird data
climbperf2 <- findMaximumClimbRate(
  myBirds,computeAvailablePower(myBirds),
  speed=myBirds$climbSpeed, # specify observed climb speeds
  strokeplane=20
)
                    
climbperf2[c('speed','climbRate','frequency','amplitude','strokeplane')]

## ---- echo=FALSE, fig.show='hold', fig.width=3.45, fig.cap="**Climb performance predicted and observed** -- Black markers indicate observed climb performance; Red markers indicate predicted performance. **Climb rate predicted and observed** -- Black markers indicate observed climb performance; Green markers indicate predicted climb performance at observed climb speed"----

par(mar=c(3.1,3.1,0.4,1.1),mgp=c(1.9,.7,0),cex=0.75)


plot(climbperf$speed,climbperf$climbRate,col='red3',xlim=c(5,21),ylim=c(-.5,2.1),xlab = NA, ylab = NA)
par(new=TRUE)
plot(climbing_birds$climbSpeed,climbing_birds$climbRate,xlim=c(5,21),ylim=c(-.5,2.1),xlab=NA, ylab=NA, axes=FALSE)
arrows(x0 = climbperf$speed, y0 = climbperf$climbRate, x1 = climbing_birds$climbSpeed, y1 = climbing_birds$climbRate,length=0.15,angle=10,col='grey90')
text(climbperf$speed-.5,climbperf$climbRate-.1,climbperf$number)
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Climb rate (m/s)')

plot(climbperf2$speed,climbperf2$climbRate,col='green3',xlim=c(9,21),ylim=c(-.1,1.8),xlab = NA, ylab = NA)
par(new=TRUE)
plot(climbing_birds$climbSpeed,climbing_birds$climbRate,xlim=c(9,21),ylim=c(-.1,1.8),xlab=NA, ylab=NA, axes=FALSE)
arrows(x0 = climbperf2$speed, y0 = climbperf2$climbRate, x1 = climbing_birds$climbSpeed, y1 = climbing_birds$climbRate,length=0.15,angle=10,col='grey90')
text(climbperf2$speed-.5,climbperf2$climbRate-.1,climbperf2$number)
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Climb rate (m/s)')

## ---- echo=FALSE, fig.show='hold', fig.width=3.45, fig.cap="**Climb performance predicted and observed** -- Birds in the top-left quadrant are predicted at nearly the observed flight speed, but were observed climbing faster than alowed by the model, indicating their drag is estimated too high. The birds in the top-right quadrant are flying at a higher flight speed than predicted and their climbrate is also higher, suggesting most likely body drag is estimated too high. The birds in the lower-right quadrant may just have been observed performing a sub-optimal climb. Alternatively particularly their lift dependent drag may be under predicted in the model. The arrows indicate the climb rate predicted by the model for the observed flight speed. In this case all positive values indicate the drag in the model is too high."----
par(mar=c(3.1,3.1,0.4,1.1),mgp=c(1.9,.7,0),cex=0.75)

plot(climbing_birds$climbSpeed/climbperf$speed-1,
     climbing_birds$climbRate-climbperf$climbRate,
     xlim = c(-.15,1),ylim = c(-1.34,.8),
     col='red3',xlab = NA, ylab = NA)
arrows(x0 = climbing_birds$climbSpeed/climbperf$speed-1,
       y0 = climbing_birds$climbRate-climbperf$climbRate,
       x1 = 0, y1 = climbing_birds$climbRate-climbperf2$climbRate,
       length=0.1,angle=10,col='grey90')

abline(v=0,col='grey')
abline(h=0,col='grey')

text(climbing_birds$climbSpeed/climbperf$speed-1-.05,
     climbing_birds$climbRate-climbperf$climbRate-.05,
     climbperf$number)

mtext(side = 1, line = 2,'Airspeed (obs./pred. - 1)')
mtext(side = 2, line = 2,'Climb rate (obs. - pred.)')


