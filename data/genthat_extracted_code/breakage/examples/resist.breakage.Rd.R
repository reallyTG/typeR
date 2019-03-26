library(breakage)


### Name: resist.breakage
### Title: Calculate resistance of a pipette tip after breakage
### Aliases: resist.breakage

### ** Examples

# specify a range of breakage distances in 100 nm steps
brks <- 0.1 * 0:150

# calculate corresponding resistances for a pipette with initial
# tip radius 50nm, half-cone angle 4 degrees, length 1mm
# and filler resistivity 64 ohm cm
res <- resist.breakage(brks, theta=4*pi/180, r=0.05, rho=64)

# plot the predicted curve of resistance against breakage
plot(res ~ brks, type="l", ylim=c(0, max(res)),
     ylab="Resistance (Mohm)", xlab="Breakage Distance (um)")



