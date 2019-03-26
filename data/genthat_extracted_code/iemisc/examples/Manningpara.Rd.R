library(iemisc)


### Name: Manningpara
### Title: Parabolic cross-section for the Gauckler-Manning-Strickler
###   equation
### Aliases: Manningpara

### ** Examples

library(iemisc)
# Exercise 4.3 from Sturm (page 153)
y <- Manningpara(Q = 12.0, B1 = 10, y1 = 2.0, Sf = 0.005, n = 0.05, units = "SI")
# defines all list values within the object named y
# Q = 12.0 m^3/s, B1 = 10 m, y1 = 2.0 m, Sf = 0.005 m/m, n = 0.05, units = SI units
# This will solve for y since it is missing and y will be in m

y$y # gives the value of y


# Modified Exercise 4.3 from Sturm (page 153)
Manningpara(y = y$y, B1 = 10, y1 = 2.0, Sf = 0.005, n = 0.05, units = "SI")
# y = 1.254427 m, B1 = 10 m, y1 = 2.0 m, Sf = 0.005 m/m, n = 0.05, units = SI units
# This will solve for Q since it is missing and Q will be in m^3/s





