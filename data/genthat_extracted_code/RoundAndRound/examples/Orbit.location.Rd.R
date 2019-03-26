library(RoundAndRound)


### Name: Orbit.location
### Title: Calculate location of a planet 'Orbit.location'
### Aliases: Orbit.location

### ** Examples

tday = seq(0, 365, 30)
x=Orbit.location(t=tday, p.orb = 365, a=10)
plot(PCS2CCS(0:360, a=10), type='l')
plotplanet(orig=x, rad = .51)
grid()



