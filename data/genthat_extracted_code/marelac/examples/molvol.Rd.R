library(marelac)


### Name: molvol
### Title: Mol to Liter Conversion for a Gas
### Aliases: molvol
### Keywords: utilities

### ** Examples

#molecular volume of an ideal gas.
molvol(species = "ideal", P = 1, t = 0)    # 22.710 980
molvol(species = "ideal", P = 1, t = 25)   # 24.789 598

plot(0:30, molvol(t = 0:30, species = NULL),
    xlab = "Temperature, dgC", ylab = "Molar volume")

#
molvol(a = 1.382, b = 0.03186, species = NULL, t = 0)

molvol(t = 0, species = "O2")

# the same but for all gasses
molvol(t = 0)

# table for different pressures
molvol(P = 1:5, species = "O2")

# the inverse function
1/molvol(species = "O2")

# contour plot
P    <- seq(1, 100, by = 1)
Temp <- seq(-5, 40, by = 1)

Val <- outer(X = P, Y = Temp,
      FUN = function(X, Y) molvol(P = X,  t = Y, species = "O2"))
contour(P, Temp, Val, xlab = "pressure", ylab = "temperature",
        main = "molvol", nlevel = 20, log = "x", axes = FALSE)
axis(1); axis(2); box()




