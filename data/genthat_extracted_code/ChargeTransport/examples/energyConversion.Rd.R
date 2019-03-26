library(ChargeTransport)


### Name: energyConversion
### Title: Energy Conversion
### Aliases: energyConversion centimeterMinusOne2electronVolt
###   centimeterMinusOne2Hartree centimeterMinusOne2Hertz
###   centimeterMinusOne2Joule centimeterMinusOne2Kelvin
###   centimeterMinusOne2kiloCaloriePerMole
###   centimeterMinusOne2kiloJoulePerMole electronVolt2centimeterMinusOne
###   electronVolt2Hartree electronVolt2Hertz electronVolt2Joule
###   electronVolt2Kelvin electronVolt2kiloCaloriePerMole
###   electronVolt2kiloJoulePerMole Hartree2centimeterMinusOne
###   Hartree2electronVolt Hartree2Hertz Hartree2Joule Hartree2Kelvin
###   Hartree2kiloCaloriePerMole Hartree2kiloJoulePerMole
###   Hertz2centimeterMinusOne Hertz2electronVolt Hertz2Hartree Hertz2Joule
###   Hertz2Kelvin Hertz2kiloCaloriePerMole Hertz2kiloJoulePerMole
###   Joule2centimeterMinusOne Joule2electronVolt Joule2Hartree Joule2Hertz
###   Joule2Kelvin Joule2kiloCaloriePerMole Joule2kiloJoulePerMole
###   Kelvin2centimeterMinusOne Kelvin2electronVolt Kelvin2Hartree
###   Kelvin2Hertz Kelvin2Joule Kelvin2kiloCaloriePerMole
###   Kelvin2kiloJoulePerMole kiloCaloriePerMole2centimeterMinusOne
###   kiloCaloriePerMole2electronVolt kiloCaloriePerMole2Hartree
###   kiloCaloriePerMole2Hertz kiloCaloriePerMole2Joule
###   kiloCaloriePerMole2Kelvin kiloCaloriePerMole2kiloJoulePerMole
###   kiloJoulePerMole2centimeterMinusOne kiloJoulePerMole2electronVolt
###   kiloJoulePerMole2Hartree kiloJoulePerMole2Hertz
###   kiloJoulePerMole2Joule kiloJoulePerMole2Kelvin
###   kiloJoulePerMole2kiloCaloriePerMole
### Keywords: manip

### ** Examples

# Return the Planck constant in eV.s
Joule2electronVolt(universalConstants["h","Value"])

# Return the Boltzmann constant in eV.K-1
Joule2electronVolt(universalConstants["kb","Value"])

# Convert electron Volt into cm-1 (E = h.c.nu_bar)
electronVolt2centimeterMinusOne(0.2)

# Convert electron Volt into Hz (E = h.nu)
electronVolt2Hertz(0.2)

# Convert Kelvin into electron Volt (E = kb.T)
Kelvin2electronVolt(300)




