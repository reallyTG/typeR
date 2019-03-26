library(hht)


### Name: PrecisionTester
### Title: Test numerically determined instantaneous frequency against
###   exact instantaneous frequency
### Aliases: PrecisionTester
### Keywords: ts

### ** Examples


#Simple signal
tt <- seq(0, 10, by = 0.01)
a <- 1
b <- 0
c <- 0
omega.1 <- 30 * pi
omega.2 <- 0
phi.1 <- 0
phi.2 <- 0
PrecisionTester(tt, method = "arctan", lag = 1, a, b, c, 
    omega.1, omega.2, phi.1, phi.2)

#That was nice - what happens if we use the "chain" method...?

PrecisionTester(tt, method = "chain", lag = 1, a, b, c, 
    omega.1, omega.2, phi.1, phi.2)

#Big problems!  Let's increase the sample rate

tt <- seq(0, 10, by = 0.0005)
PrecisionTester(tt, method = "chain", lag = 1, a, b, c, 
omega.1, omega.2, phi.1, phi.2)

#That's better

#Frequency modulations caused by signal that is not symmetric about 0

tt <- seq(0, 10, by = 0.01)
a <- 1
b <- 0
c <- 0.25
omega.1 <- 2 * pi
omega.2 <- 0
phi.1 <- 0
phi.2 <- 0

PrecisionTester(tt, method = "arctan", lag = 1, a, b, c, 
omega.1, omega.2, phi.1, phi.2)

#Non-uniform sample rate
set.seed(628)
tt <- sort(runif(500, 0, 10))
a <- 1
b <- 0
c <- 0
omega.1 <- 2 * pi
omega.2 <- 0
phi.1 <- 0
phi.2 <- 0

PrecisionTester(tt, method = "arctan", lag = 1, a, b, c, 
omega.1, omega.2, phi.1, phi.2)



