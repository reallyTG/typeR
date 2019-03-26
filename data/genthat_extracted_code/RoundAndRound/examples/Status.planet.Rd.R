library(RoundAndRound)


### Name: Status.planet
### Title: Calculate the status of planet 'Status.planet'
### Aliases: Status.planet

### ** Examples

tday = seq(0, 365, 30)
x=Status.planet(t=tday, p.orb = 365, r.orb=10)
plot(PCS2CCS(0:360, a=10), type='l')
plotplanet(orig=x[,-1], rad = .51)
grid()



