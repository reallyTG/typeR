library(astrolibR)


### Name: imf
### Title: Compute an N-component power-law logarithmic stellar initial
###   mass function
### Aliases: imf
### Keywords: misc

### ** Examples


# Calculate the number of stars per unit mass interval at 3 Msun 
# for a Salpeter (expon = -1.35) IMF, with a mass range from 
# 0.1 MSun to 110 Msun.

imf(3, -1.35, c(0.1, 110) ) / 3

# Lequeux et al. (1981) describes an IMF with an
# exponent of -0.6 between 0.007 Msun and 1.8 Msun, and an
# exponent of -1.7 between 1.8 Msun and 110 Msun.  Plot
# the mass spectrum f(m)

m = seq(0.01,0.1,length=110)  # construct a mass vector
expon = c(-0.6, -1.7)         # exponent vector
mass_range = c(0.007, 1.8, 110)    # mass range
plot (log10(m), log10(imf(m, expon, mass_range) / m), pch=20)



