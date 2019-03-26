library(Rssa)


### Name: eossa
### Title: ESPRIT-based O-SSA nested decomposition
### Aliases: eossa eossa.ssa

### ** Examples

# Separability of three finite-dimensional series, EOSSA vs Basic SSA
N <- 150
L <- 70
omega1 <- 0.065
omega2 <- 0.07
omega3 <- 0.02
sigma <- 0.5

F1.real <- 2*sin(2*pi*omega1*(1:N))
F2.real <- 4*sin(2*pi*omega2*(1:N))
F3.real <- sin(2*pi*omega3*(1:N))

noise <- rnorm(N, sd = sigma)
F <- F1.real + F2.real + F3.real + noise

ss <- ssa(F, L)
eoss <- eossa(ss, nested.groups = list(1:2, 3:4, 5:6), k = 3)

print(eoss)

plot(ss, type = "series", groups = list(1:2, 3:4, 5:6))
plot(eoss, type = "series", groups = eoss$iossa.groups)

plot(reconstruct(ss,
                 groups = list(1:2, 3:4, 5:6)),
     add.residuals = TRUE, plot.method = "xyplot", main = "",
     xlab = "")

plot(reconstruct(eoss, groups = list(1:2, 3:4, 5:6)),
     add.residuals = TRUE, plot.method = "xyplot", main = "",
     xlab = "")

plot(reconstruct(ss,
                 groups = list(Reconstructed = 1:6, F1 = 1:2, F2 = 3:4, F3 = 5:6)),
     add.residuals = TRUE, plot.method = "xyplot", main = "",
     xlab = "")

plot(reconstruct(eoss,
                 groups = list(Reconstructed = 1:6, F1 = 1:2, F2 = 3:4, F3 = 5:6)),
     add.residuals = TRUE, plot.method = "xyplot", main = "",
     xlab = "")

rec.ideal <- reconstruct(ss,
                         groups = list(Signal = 1:6, F1 = 1:2, F2 = 3:4, F3 = 5:6))
rec.ideal$Signal <- F1.real + F2.real + F3.real
rec.ideal$F1 <- F2.real
rec.ideal$F2 <- F1.real
rec.ideal$F3 <- F3.real

plot(rec.ideal,
     add.residuals = TRUE, plot.method = "xyplot", main = "",
     xlab = "")

# Real-life example (co2), EOSSA vs Basic SSA
sigma <- 0.05 
ss <- ssa(co2)
plot(ss, type = "vector")
eoss <- eossa(ss, 1:6, k = 4)
eoss$iossa.groups

plot(eoss)
rec <- reconstruct(eoss, groups = eoss$iossa.groups)
plot(rec)

plot(reconstruct(ss,
                 groups = list(ET1 = 1,ET2 = 2,ET3 = 3,ET4 = 4,ET5 = 5,ET6 = 6)),
     add.residuals = TRUE, plot.method = "xyplot", main = "",
     xlab = "")

plot(reconstruct(eoss,
                 groups = eoss$iossa.groups),
     add.residuals = TRUE, plot.method = "xyplot", main = "",
     xlab = "")

# Sine wave with phase shift, EOSSA vs Basic SSA
omega1 <- 0.06
omega2 <- 0.07
sigma <- 0.25

F1.real <- sin(2*pi*omega1*(1:N))
F2.real <- sin(2*pi*omega2*(1:N))
v <- c(F1.real,  F2.real)
v <- v + rnorm(v, sd = sigma)
# v <- c(F1.real,  F2.real)

ss <- ssa(v, L = 35)

eoss <- eossa(ss, 1:4, 2)
ioss <- iossa(ss, list(1:2, 3:4))

plot(reconstruct(eoss, groups = eoss$iossa.groups))

plot(reconstruct(eoss,
     groups = eoss$iossa.groups), plot.method = "xyplot", main = "",
     xlab = "")

plot(reconstruct(ss, groups = list(1:2, 3:4)),
     plot.method = "xyplot",
     main = "", xlab = "")
plot(reconstruct(ss, groups = list(1,2, 3,4)),
     plot.method = "xyplot",
     main = "", xlab = "")



