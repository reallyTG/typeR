library(MEMSS)


### Name: Theoph
### Title: Pharmacokinetics of theophylline
### Aliases: Theoph
### Keywords: datasets

### ** Examples

require(lattice)
xyplot(conc ~ Time | Subject, Theoph, aspect = 'xy',
     xlab = "Time since drug administration (hr)",
     ylab = "Theophylline concentration (mg/L)")
Theoph.D <- subset(Theoph, Subject == "D")
fm1 <- nls(conc ~ SSfol(Dose, Time, lKe, lKa, lCl),
           data = Theoph.D)
summary(fm1)
plot(conc ~ Time, data = Theoph.D,
     xlab = "Time since drug administration (hr)",
     ylab = "Theophylline concentration (mg/L)",
     main = "Observed concentrations and fitted model",
     sub  = "Theophylline data - Subject 4 only",
     las = 1, col = 4)
xvals <- seq(0, par("usr")[2], len = 55)
lines(xvals, predict(fm1, newdata = list(Time = xvals)),
      col = 4)



