library(astrochron)


### Name: etp
### Title: Generate eccentricity-tilt-precession models
### Aliases: etp

### ** Examples

# create an ETP model from 10000 ka to 20000 ka, with a 5 ka sampling interval
# this will automatically download the astronomical solution
ex=etp(tmin=10000,tmax=20000,dt=5)

# alternatively, download the astronomical solution first
ex2=getLaskar()
ex=etp(tmin=10000,tmax=20000,dt=5,solution=ex2)



