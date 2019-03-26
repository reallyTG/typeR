library(geophys)


### Name: get.heat2
### Title: Heat Equation Solution
### Aliases: get.heat2 ' get.heat'
### Keywords: misc

### ** Examples

 k = 1*10^(-6)
dt = 3600
 dz = 20*10^(-2)

T0=25

T1 = 1200



x =  seq(from=0, to=80, by=0.5)/100

i = 1
Tx =  get.heat2(x, T1-T0, k, i*dt)

plot(Tx, max(x)-x, type='n', xlim=c(700, 1200) , axes=FALSE, xlab="Temp", ylab="Depth, cm")
axis(3)
axis(2, at=pretty(x), labels=100*(max(x)-pretty(x)))

for(j in 1:5)
{
Tx =  get.heat2(x, T1-T0, k, j*dt)
Tx = Tx+T0
lines(Tx, max(x)-x, lty=2, col=j)
}







