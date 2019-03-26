## ------------------------------------------------------------------------
library('afpt')

## ------------------------------------------------------------------------
myBird <- Bird(
  massTotal = 0.215, 
  wingSpan = 0.67, 
  wingArea = 0.0652,
  name = 'Jackdaw',
  name.scientific = 'Corvus monedula',
  type = 'passerine',
  source = 'KleinHeerenbrink M, Warfvinge K and Hedenström A 2016 J.Exp.Biol. 219: 10, 1572--1581'
)

## ------------------------------------------------------------------------
speed <- seq(6,18,length.out=6) #  airspeed in m/s
powercurve <- computeFlappingPower(myBird,speed)

## ---- fig.show='hold', fig.width=3.45, fig.cap="**Drag components** -- Black: total drag; red circles: induced drag; green squares: zero-lift profile drag; blue diamonds: lift-dep. profile drag; yellow triangles: parasitic drag."----
par(mar=c(3.1,3.1,0.4,1.1),mgp=c(1.9,0.7,0.0),cex=0.75)
with(powercurve , plot( speed, Dnf.ind+Dnf.pro0+Dnf.pro2+Dnf.par, 
                        type='b', pch=15, col='grey20', 
                        xlab=NA, ylab=NA, xlim=c(0,20), ylim=c(0,0.39)))
with(powercurve , lines( speed, Dnf.ind, type='b', pch=21, col='red3'))
with(powercurve , lines( speed, Dnf.pro0, type='b', pch=22, col='green3'))
with(powercurve , lines( speed, Dnf.pro2, type='b', pch=23, col='blue3'))
with(powercurve , lines( speed, Dnf.par, type='b', pch=24, col='yellow3'))
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Drag components (N)')

## ------------------------------------------------------------------------
with(myBird,coef.bodyDragCoefficient*bodyFrontalArea)

## ------------------------------------------------------------------------
myBird$coef.bodyDragCoefficient <- 0.001004007 #  the product CDb*Sb
myBird$bodyFrontalArea <- 1 #  unit area
with(myBird,coef.bodyDragCoefficient*bodyFrontalArea)

## ------------------------------------------------------------------------
myBird$coef.bodyDragCoefficient <- 0.01539888 #  CDb relative to wing reference area
myBird$bodyFrontalArea <- myBird$wingArea #  unit area
with(myBird,coef.bodyDragCoefficient*bodyFrontalArea)

## ------------------------------------------------------------------------
powercurve[c('speed','amplitude','strokeplane','frequency')]

## ---- fig.show='hold', fig.width=3.45, fig.cap="**Drag factors** -- red circles: induced drag; green squares: zero-lift profile drag; blue diamonds: lift-dep. profile drag."----
par(mar=c(3.1,3.1,0.4,1.1),mgp=c(1.9,0.7,0.0),cex=0.75)
kf <- 2*pi*myBird$wingSpan*myBird$wingbeatFrequency / speed #  reduced frequency
phi <- powercurve$strokeplane*pi/180 #  strokeplane angle in radians (optimized)
fD <- data.frame(
  ind = fD.ind(kf,phi), #  induced drag
  pro0 = fD.pro0(kf,phi), #  zero lift profile drag
  pro2 = fD.pro2(kf,phi), #  lift dep. profile drag
  par = 0 # parasitic drag is wingbeat independent
)
plot( speed, fD$ind, type='b', pch=21, col='red3', 
      xlab=NA, ylab=NA, xlim=c(0,20), ylim=c(-1,6.6))
lines( speed, fD$pro0, type='b', pch=22, col='green3')
lines( speed, fD$pro2, type='b', pch=23, col='blue3')
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Drag factors fD (-)')

## ------------------------------------------------------------------------
thrustratio <- apply(powercurve[,grep('Dnf',names(powercurve))],1,sum) /
  (powercurve$L - apply(fD*powercurve[,grep('Dnf',names(powercurve))],1,sum))

## ------------------------------------------------------------------------
fP <- data.frame(
  ind = fP.ind(kf,phi), #  induced power
  pro0 = fP.pro0(kf,phi), #  zero lift profile power
  pro2 = fP.pro2(kf,phi), #  lift dep. profile power
  par = 0 #  parasitic power is wingbeat independent
)

## ------------------------------------------------------------------------
kP <- 1 + fP*thrustratio

## ---- fig.show='hold', fig.width=3.45, fig.cap="**Power factors** -- red circles: induced drag; green squares: zero-lift profile drag; blue diamonds: lift-dep. profile drag."----
par(mar=c(3.1,3.1,0.4,1.1),mgp=c(1.9,0.7,0.0),cex=0.75)
plot( speed, fP$ind, type='b', pch=21, col='red3', 
      xlab=NA, ylab=NA, xlim=c(0,20), ylim=c(-0.4,8))
lines( speed, fP$pro0, type='b', pch=22, col='green3')
lines( speed, fP$pro2, type='b', pch=23, col='blue3')
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Power factors fP (-)')

plot( speed, kP$ind, type='b', pch=21, col='red3', 
      xlab=NA, ylab=NA, xlim=c(0,20), ylim=c(0.8,2.3))
lines( speed, kP$pro0, type='b', pch=22, col='green3')
lines( speed, kP$pro2, type='b', pch=23, col='blue3')
mtext(side = 1, line = 2,'Airspeed (m/s)')
mtext(side = 2, line = 2,'Power factors kP (-)')

## ------------------------------------------------------------------------
powercurve[,grep('flags',names(powercurve))]

