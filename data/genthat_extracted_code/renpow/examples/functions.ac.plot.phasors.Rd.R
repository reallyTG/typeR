library(renpow)


### Name: AC waves and plots
### Title: AC in the time and frequency domain
### Aliases: ACcircuits waves ac.plot phasor.plot polar recta mult.polar
###   div.polar horiz.lab wave.leg phas.leg gridcir sinplot arc rot.fig
###   admit vector.phasor
### Keywords: hplot dplot math

### ** Examples


# from Chapter 5
# one wave show phase angle
x <- list(c(170,30)); v.t <- waves(x); ac.plot(v.t)

# two waves different magnitude and phase
x <- list(c(170,0),c(160,30)); v.t <- waves(x);
v.lab <- c("v1(t)","v2(t)"); v.units <- rep("V",2)
ac.plot(v.t,v.lab,v.units)

# one phasor
v.p <- list(c(170,10)); phasor.plot(v.p)

# phasors phase difference
v.units <- rep("V",2)
v.lab <- c("V1","V2")
# V1 leads V2
v.p <- list(c(170,70),c(170,50))
phasor.plot(v.p,v.lab,v.units)

# rect to polar
polar(c(2,1))
# polar to rect
recta(c(2,45))
# multiplication
x <- polar(c(1,2))
y <- polar(c(2,3))
mult.polar(x,y)

# from Chapter 8
# nodal analysis
Y1 <- 1/(5+5i); Y2 <- 1/(5+5i); Y3 <- 1/(10+10i) 
Y <- matrix(c(Y1+Y2,-Y2,-Y2,Y3+Y2),ncol=2,byrow=TRUE)
Is <- c(1+0i,0+0i)
Vn <- solve(Y,Is)
VpIp <- vector.phasor(Vn,Is)
phasor.plot(VpIp$VI, c("V1","V2","Is1","Is2"),
           c("V","V","A","A"),lty.p=c(2,2,1,1))




