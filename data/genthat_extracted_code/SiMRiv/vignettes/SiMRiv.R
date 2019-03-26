### R code from vignette source 'SiMRiv.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: version
###################################################
#options(width = 60)
version <- packageDescription("SiMRiv")
#colorramp <- rgb(c(seq(4, 9, len = 5), rep(9, 5)), c(rep(9, 5), seq(9, 4, len = 5)), 0, max = 9)
#colorramp <- rgb(9, 9:0, 9:0, max = 9)


###################################################
### code chunk number 2: SiMRiv.Rnw:21-38
###################################################
my.Swd <- function(name, width, height, ...) {
  grDevices::png(filename = paste(name, "png", sep = "."),
                 width = 8, height = 8, res = 100, units = "in")
}
my.Swd.off <- function() {
    grDevices::dev.off()
}

my.Swd2 <- function(name, width, height, ...) {
  grDevices::png(filename = paste(name, "png", sep = "."),
                 width = 8, height = 8 * 2, res = 100, units = "in")
}
my.Swd2.off <- function() {
    grDevices::dev.off()
}

library(SiMRiv)


###################################################
### code chunk number 3: simriv-1
###################################################
# define a species with a single-state movement type
# characterized by a random walk
rand.walker <- species(state.RW())

# simulate one individual of this species, 10000 simulation steps
sim.rw <- simulate(rand.walker, 10000)

# plot trajectory
plot(sim.rw, type = "l", asp = 1, main = "Random walk")


###################################################
### code chunk number 4: simriv-2
###################################################
# define a species with a single-state movement type characterized
# by a correlated random walk with concentration=0.98
c.rand.walker <- species(state.CRW(0.98))

# simulate one individual of this species
# 10000 simulation steps
sim.crw <- simulate(c.rand.walker, 10000)

plot(sim.crw, type = "l", asp = 1, main = "Correlated Random walk")


###################################################
### code chunk number 5: simriv-3
###################################################
# define a species with a correlated random walk
# and step length = 15
c.rand.walker.15 <- species(state.CRW(0.98) + 15)

# which, in single-state species, is the same as:
c.rand.walker.15 <- species(state.CRW(0.98)) + 15


###################################################
### code chunk number 6: simriv-4
###################################################
# a Lévy walker can be approximated by a two-state walker
# composed of a random walk state and a correlated
# random walk state.
levy.walker <- species(state.RW() + state.CRW(0.98)
  , trans = transitionMatrix(0.005, 0.01)) + 25

sim.lw <- simulate(levy.walker, 10000)

plot(sim.lw, type = "l", asp = 1, main = "Lévy-like walker")


###################################################
### code chunk number 7: simriv-5
###################################################
resistance <- resistanceFromShape(
  system.file("doc/landcover.shp", package="SiMRiv")
  , res = 100)
plot(resistance, axes = F)


###################################################
### code chunk number 8: simriv-6
###################################################
resistance <- resistanceFromShape(
  system.file("doc/landcover.shp", package="SiMRiv")
  , res = 100, field = "coverclass", mapvalues = c(
    "forest" = 0.5, "urban" = 1, "dam" = 0
    , "shrubland" = 0.75)
  , background = 0.9, margin = 3000)

plot(resistance, axes = F)


###################################################
### code chunk number 9: simriv-7
###################################################
resistance <- resistanceFromShape(
  system.file("doc/river-sample.shp", package="SiMRiv")
  , res = 100, field = "Order", mapvalues = c("2" = 0
    , "3" = 0.2, "4" = 0.4, "5" = 0.6, "6" = 0.8)
  , buffer = 150, background = 0.95, margin = 3000)

plot(resistance, axes = F)


###################################################
### code chunk number 10: simriv-8
###################################################
# load shapefile
river.shape <- shapefile(system.file("doc/river-sample.shp", package="SiMRiv"))

# below you can provide the shapefile filename, or the
# R shapefile object itself
resistance <- resistanceFromShape(river.shape, res = 100
  , buffer = (9 - river.shape@data$Order) ^ 3
  , background = 0.95, margin = 3000)

# buffer here is just some magical function to convert river
# order into a meaningful value in the [0, 1] range!

plot(resistance, axes = F)


###################################################
### code chunk number 11: simriv-9
###################################################
landcover <- resistanceFromShape(
  system.file("doc/landcover.shp", package="SiMRiv")
  , res = 50, field = "coverclass", mapvalues = c(
    "forest" = 0.5, "urban" = 1, "dam" = 0
    , "shrubland" = 0.75), background = 0.95)

river.landcover <- resistanceFromShape(
  system.file("doc/river-sample.shp", package="SiMRiv")
  , baseRaster = landcover, buffer = 100, field = 0
  , background = 0.95, margin = 3000)

plot(river.landcover, axes = F)


###################################################
### code chunk number 12: simriv-10
###################################################
# set starting coordinates anywhere within the river
init = xyFromCell(river.landcover, sample(which(values(river.landcover) == 0), 1))


# adding a number to a species is a shortcut for setting
# the step lengths of all states
# multiplying is a shortcut for setting the perceptual range radius
levy.walker <- (levy.walker + 15) * 1000

sim.lw.river <- simulate(levy.walker, 40000
  , resist = river.landcover, coords = init)

# plot resistance
plot(river.landcover, axes = F
  , ylim = range(sim.lw.river[, 2]), xlim = range(sim.lw.river[, 1]))

# plot trajectory on top of resistance
lines(sim.lw.river)



