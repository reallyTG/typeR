library(TauP.R)


### Name: FindRoots
### Title: Find Roots of X(a) Error Function
### Aliases: FindRoots
### Keywords: misc

### ** Examples

data(model)
phase = 'P'
delta = 60
h = 100
startalpha = c(30, 31)
startdelta = FindDist4p('P', 100, model, takeoff = startalpha)$dist

FindRoots(phase, delta, h, model, startalpha, startdelta)




