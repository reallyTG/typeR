library(cycloids)


### Name: zykloid.scaleAa
### Title: Wrapper for 'zykloid' which scales a cycloid by its outer radius
###   and allows free positioning
### Aliases: zykloid.scaleAa
### Keywords: math graphs

### ** Examples


# Same epicycloid scaled to different maximum radii of the figure
cycl1 <- zykloid.scaleAa(A = 21, a = 11, lambda = 1, hypo = FALSE,
                         RadiusAa = 100)
cycl2 <- zykloid.scaleAa(A = 21, a = 11, lambda = 1, hypo = FALSE,
                         RadiusAa =  70)
cycl3 <- zykloid.scaleAa(A = 21, a = 11, lambda = 1, hypo = FALSE,
                         RadiusAa =  40)
plot (y ~ x, data = cycl1, col = "red", asp = 1, type = "l",
      main = "A = 21, a = 11, lambda = 1")
lines(y ~ x, data = cycl2, col = "green")
lines(y ~ x, data = cycl3, col = "blue")
legend("topleft", c("RadiusAa = 100", "RadiusAa =  70", "RadiusAa =  40"),
       lty = rep("solid", 3), col = c("red", "green", "blue"), bty = "n")
       

# Pentagram by constructing a hypocycloid and an epicycloid
# with the same outer radius and scaling this radius exponentially
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-40, 40), ylim = c(-40, 40))
n <- 20
ccol <- heat.colors(n)
for(i in c(1:n)) {
    zzz <- zykloid.scaleAa(A = 5, a = 2,
           RadiusAa = 38*exp(-0.05*(i-1)), hypo = FALSE, lambda = 1)
    lines(y ~ x, data = zzz, col = ccol[i])
    zzz <- zykloid.scaleAa(A = 5, a = 2,
           RadiusAa = 38*exp(-0.05*(i-1)), hypo = TRUE,  lambda = 1)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# Psychedelic star by modifying lambda while keeping the outer
# radius constant
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-5, 5), ylim = c(-5, 5))
llam <- seq(0, 8, 0.2)
ccol <- terrain.colors(length(llam))
for(i in c(1:length(llam))) {
    zzz <- zykloid.scaleAa(A = 5, a = 1, RadiusAa = 4.5,
           hypo = FALSE, lambda = llam[i])
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)




