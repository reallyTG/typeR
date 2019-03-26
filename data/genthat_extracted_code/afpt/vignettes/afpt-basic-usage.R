## ------------------------------------------------------------------------
library('afpt')

## ------------------------------------------------------------------------
myBird <- Bird(
  massTotal = 0.215, #  weight in kg
  wingSpan = 0.67,  #  wingspan in m
  wingArea = 0.0652, #  wing area in m2
  name = 'Jackdaw',
  name.scientific = 'Corvus monedula',
  type = 'passerine',
  source = 'KleinHeerenbrink M, Warfvinge K and Hedenstrom A (2016) J.Exp.Biol. 219: 10, 1572--1581'
)

## ------------------------------------------------------------------------
myBird$bodyFrontalArea

## ------------------------------------------------------------------------
myBird$wingbeatFrequency <- 5

## ------------------------------------------------------------------------
flightperf <- computeFlightPerformance(myBird)
flightperf

## ---- fig.show='hold', fig.width=3.45, fig.cap="**Powercurves** -- aerodynamic power in black; chemical power in red. **Peak amplitude** -- optimal flapping amplitude corresponding to powercurve "----
powercurve <- flightperf$powercurve
plot(flightperf,symbol.speed="U")

plot(powercurve$speed,powercurve$amplitude,xlab=NA,ylab=NA,type='b',xlim=c(0,20),ylim=c(20,60))
mtext(side = 1, line = 2, 'Airspeed (m/s)')
mtext(side = 2, line = 2, 'Peak amplitude (deg)')

## ------------------------------------------------------------------------
flightperf$table[c('speed','frequency','strokeplane','amplitude')]

## ------------------------------------------------------------------------
flightperf$table[,grep('^flags.',names(flightperf$table))]

## ------------------------------------------------------------------------
flightperf$table[,grep('^Dnf.',names(flightperf$table))]

## ---- fig.show='hold', fig.width=3.45, fig.cap="**Non-flapping drag components** -- Red: induced drag; green: zero-lift profile drag; blue: lift-dep. profile drag; yellow: parasitic drag;"----
par(mar=c(3.1,3.1,0.4,1.1),mgp=c(1.9,.7,0),cex=0.75)
with(powercurve , plot( speed, Dnf.ind, type='b', col='red3', 
                        xlab=NA, ylab=NA, xlim=c(0,20), ylim=c(0.0,0.20)))
with(powercurve , lines( speed, Dnf.pro0, type='b', col='green3'))
with(powercurve , lines( speed, Dnf.pro2, type='b', col='blue3'))
with(powercurve , lines( speed, Dnf.par, type='b', col='yellow3'))
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Drag (N)')

## ------------------------------------------------------------------------
flightperf$table[,grep('^kD.',names(flightperf$table))]

## ------------------------------------------------------------------------
flightperf$table[,grep('^kP.',names(flightperf$table))]

## ---- fig.show='hold', fig.width=3.45, fig.cap="**Drag factors** -- Red: induced drag; green: zero-lift profile drag; blue: lift-dep. profile drag; there is no factor for parasitic drag, because this component is assumed independent of wingbeat kinematics. **Power factors** -- same legend."----
par(mar=c(3.1,3.1,0.4,1.1),mgp=c(1.9,.7,0),cex=0.75)
with(powercurve , plot( speed, kD.ind, type='b', col='red3', 
                        xlab=NA, ylab=NA, xlim=c(0,20), ylim=c(0.5,2.5)))
with(powercurve , lines( speed, kD.pro0, type='b', col='green3'))
with(powercurve , lines( speed, kD.pro2, type='b', col='blue3'))
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Drag factors (-)')

with(powercurve , plot( speed, kP.ind, type='b', col='red3', 
                        xlab=NA, ylab=NA, xlim=c(0,20), ylim=c(0.5,2.5)))
with(powercurve , lines( speed, kP.pro0, type='b', col='green3'))
with(powercurve , lines( speed, kP.pro2, type='b', col='blue3'))
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Power factors (-)')

## ------------------------------------------------------------------------
flightperf$table[c('frequency','L','ReynoldsNumber','CDpro0')]

## ------------------------------------------------------------------------
myFlightCondition <- list(
  density = 0.9093, # [kg/m3] 3 km altitude
  gravity = 9.81, # [m/s2]
  viscosity = 18.63E-6, # [m2/s] 3 km altitude
  windSpeed = 0,# [m/s]
  windDir = 0 # [degrees] 0 degrees means wind is along the track direction
)

## ------------------------------------------------------------------------
flightperf.ISA3 <- computeFlightPerformance(myBird,flightcondition=myFlightCondition)
flightperf.ISA3

## ------------------------------------------------------------------------
COT.ISA0 <- with(flightperf$table,power.chem/speed); 
COT.ISA3 <-with(flightperf.ISA3$table,power.chem/speed); 
list(ISA0 = COT.ISA0, ISA3 = COT.ISA3)
COT.ISA3/COT.ISA0

