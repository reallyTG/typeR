library(cycloids)


### Name: zykloid.scaleP
### Title: Wrapper for 'zykloid' which scales a cycloid by the circle its
###   peaks are located on and allows free positioning
### Aliases: zykloid.scaleP
### Keywords: math graphs

### ** Examples


# Epitrochoids with different lambda scaled to the same radius of
# the peak circle
cycl1 <- zykloid.scaleP(A = 21, a = 11, lambda = 1.2, hypo = FALSE,
                         RadiusP = 10)
cycl2 <- zykloid.scaleP(A = 21, a = 11, lambda = 1.0, hypo = FALSE,
                         RadiusP = 10)
cycl3 <- zykloid.scaleP(A = 21, a = 11, lambda = 0.8, hypo = FALSE,
                         RadiusP = 10)
plot (y ~ x, data = cycl1, col = "red", asp = 1, type = "l",
      main = "A = 21, a = 11, RadiusP = 10")
lines(y ~ x, data = cycl2, col = "green")
lines(y ~ x, data = cycl3, col = "blue")
legend("topleft", c("lambda = 1.2", "lambda =  1.0", "lambda =  0.8"),
       lty = rep("solid", 3), col = c("red", "green", "blue"),
       bty = "n")



# Cool Disk by scaling the start angle with an
# exponential function ...
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-11, 11), ylim = c(-11, 11))
n <- 30
ccol <- topo.colors(n)
for(i in c(1:n)) {
    zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = 6, lambda = 1,
           start = 2*pi/3 * exp(-0.1 * (i - 1)), hypo = FALSE)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# ... the free space in the centre could be filled with
# the corresponding hypocycloid ...
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-11, 11), ylim = c(-11, 11))
n <- 30
ccol <- topo.colors(n)
for(i in c(1:n)) {
    zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = 6, lambda = 1,
           start = 2*pi/3 * exp(-0.1 * (i - 1)), hypo = FALSE)
    lines(y ~ x, data = zzz, col = ccol[i])
    zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = 6, lambda = 1,
           start = 2*pi/3 * exp(-0.1 * (i - 1)), hypo = TRUE)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# ... or the same ring again and again.
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-11, 11), ylim = c(-11, 11))
n <- 30
ccol <- topo.colors(n)
rad <- 6
for(g in c(1:7)) {
    for(i in c(1:n)) {
        zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = rad,
               lambda = 1, start = 2*pi/3 * exp(-0.1 * (i - 1)),
               hypo = FALSE)
        lines(y ~ x, data = zzz, col = ccol[i])
    } # for i
    rad <- rad * 3/5
} # for g
par(op)



# Cauliflower pattern. Here, an exponential function is used
# for scaling the radius of the circle the cycloid's loops
# are on.
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-22, 22), ylim = c(-22, 22))
n <- 15
dcol <- heat.colors(n)
for(i in c(1:n)) {
    lambdax <- seq(2.0, 2.2, 0.1)
    for(j in c(1:length(lambdax))) {
        zzz <- zykloid.scaleP(A = 11, a = 1,
               RadiusP = 15 * exp(-0.3 * (i - 1)),
               lambda = lambdax[j], hypo = FALSE,
               start = pi/2 + (i - 1)*pi/11)
        if(j/2 == floor(j/2)) { colx <- "blue" }
        else                  { colx <- dcol[n + 1 - i] }
        lines(y ~ x, data = zzz, col = colx)
    } # for j
} # for i
par(op)



# Sparkling star
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-15, 15), ylim = c(-15, 15))
llam <- seq(0, 8, 0.2)
ccol <- rainbow(length(llam), start = 2/3, end = 1/3)
for(i in c(1:length(llam))) {
    zzz <- zykloid.scaleP(A = 5, a = 1, RadiusP = 2.1,
           hypo = FALSE, lambda = llam[i], start = pi/5)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)





