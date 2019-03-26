library(cycloids)


### Name: zykloid.scaleA
### Title: Wrapper for 'zykloid' which allows to scale and position a
###   cycloid by the radius A of the fixed circle and its midpoint
### Aliases: zykloid.scaleA
### Keywords: math graphs

### ** Examples


# Same hypotrochoid scaled to different radii of the fix circle
cycl1 <- zykloid.scaleA(A = 7, a = 3, lambda = 2/3, RadiusA = 1.3)
cycl2 <- zykloid.scaleA(A = 7, a = 3, lambda = 2/3, RadiusA = 1.0)
cycl3 <- zykloid.scaleA(A = 7, a = 3, lambda = 2/3, RadiusA = 0.7)
plot (y ~ x, data = cycl1, asp = 1, col = "red", type = "l",
      main = "A = 7, a = 3, lambda = 2/3")
lines(y ~ x, data = cycl2, asp = 1, col = "green")
lines(y ~ x, data = cycl3, asp = 1, col = "blue")
legend("topleft", c("RadiusA = 1.3", "RadiusA = 1.0", "RadiusA = 0.7"),
       lty = rep("solid", 3), col = c("red", "green", "blue"), bty = "n")
       


# In this example, RadiusA depends on the cosine of the x-coordinate
# of the fixed circle's centre
op <- par(mar = c(0,0,0,0), bg = "black")
ctrx <- seq(-2*pi, 2*pi, pi/10)
ccol <- rainbow(length(ctrx))
plot.new()
plot.window(asp = 1, xlim = c(-8, 8), ylim = c(-0.5, 0.5))
for(i in c(1:length(ctrx))) {
    zzz <- zykloid.scaleA(A = 9, a = 7, hypo = TRUE, Cx = ctrx[i],
                          Cy = -ctrx[i], lambda = 0.9,
                          RadiusA = 1.5 + cos(ctrx[i]), start = -pi/4)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# Geometric degression of RadiusA makes a nice star
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-10, 10), ylim = c(-10, 10))
rad <- 10
n <- 60
ccol <- heat.colors(n)
for(i in c(1:n)) {
    if (i/2 != floor(i/2)) { sstart = pi/2 }
    else                   { sstart = pi/4 }
    zzz <- zykloid.scaleA(A = 4, a = 3, RadiusA = rad, lambda = 1,
                          start = sstart)
    lines(y ~ x, data = zzz, col = ccol[i])
    rad <- rad * 0.9
} # for i
par(op)



# A windmill
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-1.4, 1.4), ylim = c(-1.4, 1.4))
rrad <- sqrt(seq(0.1, 2, 0.1))
n    <- length(rrad)
ccol <- rainbow(n, start = 0, end = 0.3)
for(i in c(1:n)) {
    zzz <- zykloid.scaleA(A = 7, a = 3, RadiusA = rrad[i],
           hypo = TRUE, lambda = 1.1,
           start = pi/2 - (1*pi/7 - (i - 1) * 2*pi/(7 * n)))
    lines(y ~ x, data = zzz, col = ccol[n + 1 - i])
} # for i
par(op)



# Advanced Example: A series of cycloids with their centres
# located on a logarithmic spiral
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-50, 50), ylim = c(-50, 50))
a     <- 1/32     # spiral's scaling constant
alpha <- pi/20    # spiral's slope angle
sphi  <- seq(0, 18 * pi, pi/25)   # series of angles for cycloid centres
rad  <- a * exp(tan(alpha)*sphi)  # corresponding spiral radii
spx  <- rad * cos(sphi)           # corresponding x-coordinates
spy  <- rad *sin(sphi)            # corresponding y-coordinates
n    <- length(sphi)
ccol <- rainbow(n, start = 2/3, end = 1/2)
for (i in c(1:n)) {
     czc <- zykloid.scaleA(A = 3, a = 1, lambda = 1.5,
            Cx = spx[i], Cy = spy[i],
            RadiusA = rad[i]/2.5, # cycloid radii depends on spiral radii
            start = pi + sphi[i]) # angle cycloid towards spiral centre
     lines(y ~ x, data = czc, col = ccol[i])
} # for i
par(op)





