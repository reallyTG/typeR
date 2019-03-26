library(astro)


### Name: schechter
### Title: The Schechter Function
### Aliases: schechter
### Keywords: data

### ** Examples


#
#
# Driver et al. 2008, Figure 2 (magnitude)
#
#

# setup input magnitudes
mag = seq(-24,-17,len=100)

# calculate number densities
num = schechter(mag, bw = 0.5, mag = TRUE, log = FALSE, knee = -21.32, 
slope = -1.32, norm = 4.8E-3)

# plot
aplot(mag, log10(0.5*num), las=1, ylim=c(-6,-2), type="l", xaxs="i", yaxs="i", 
nxmin=1, xlab="Magnitude / mag", 
ylab=bquote(paste("log ", phi, " [ 0.5mag ]", " "^-1)), 
main="Driver et al. 2008, Figure 2")
label("bottomright", lab=bquote(paste("M* = -21.32     ", 
alpha, " = -1.32     ", phi, "* = 4.8x", 10^{-3})), inset=0.1)

#
#
# Baldry et al. 2012, Figure 13 (stellar mass)
#
#

# setup input masses
mass = seq(7,11.6,len=100)

# calculate number densities
num = schechter(mass, bw = 0.1, mag = FALSE, log = TRUE, knee = 10.66, 
slope = c(-0.35,-1.47), norm = c(3.96E-3,0.79E-3))

# plot
aplot(log10(mass), num, las=1, ylim=c(1e-5,2e-1), type="l", log="y", xaxs="i", 
yaxs="i", xlab="log (M / Msun)", 
ylab=bquote(paste("number density (", dex^{-1}, " ", , Mpc^{-3}, ")")), 
yformat="p", main="Baldry et al. 2012, Figure 13")
label("bottomleft", 
lab=bquote(paste("log M* = 10.66   ", alpha[1], " = -0.35   ", 
phi, "*", ""[1], " = 3.96x", 10^{-3}, "   ", alpha[2], " = -1.47   ", 
phi, "*", ""[2], " = 0.79x", 10^{-3})), inset=0.1)




