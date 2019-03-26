library(marelac)


### Name: viscosity
### Title: Shear Viscosity of Water
### Aliases: viscosity
### Keywords: utilities

### ** Examples

plot(0:30, viscosity(t = 0:30, S = 35, P = 1),
      xlab = "temperature", ylab = "g/m/s",
      main = "shear viscosity of water", type = "l")
lines(0:30, viscosity(t = 0:30, S = 0, P = 1), col = "red")
lines(0:30, viscosity(t = 0:30, S = 35, P = 100), col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1,
        legend = c("S=35, P=1", "S=0, P=1", "S=35, P=100"))



