library(rivr)


### Name: route_wave
### Title: Flood wave routing
### Aliases: route_wave

### ** Examples

## Not run: 
##D  
##D # kinematic wave routing
##D times = seq(0, 30000, by = 25)
##D floodwave = ifelse(times >= 9000, 250,
##D   250 + (750/pi)*(1 - cos(pi*times/(60*75))))
##D route_wave(0.001, 0.045, 1.486, 32.2, 100, 0, initial.condition = 250, 
##D   boundary.condition = floodwave, timestep = 25, spacestep = 50, 
##D   numnodes=301, monitor.nodes = c(1, 101, 201, 301), 
##D   monitor.times = seq(1, length(times), by = 10), engine = "Kinematic")
##D # dynamic wave routing with zero-gradient downstream condition using MacCormack scheme
##D route_wave(0.001, 0.045, 1.486, 32.2, 100, 0, initial.condition = 250, 
##D   boundary.condition = floodwave, downstream.condition = rep(-1, length(times)), 
##D   timestep = 25, spacestep = 500, numnodes = 31, engine = "Dynamic", 
##D   scheme = "MacCormack", monitor.nodes = c(1, 11, 21, 31), 
##D   monitor.times = seq(1, length(times), by = 10))
##D # mixed boundary conditions (sudden gate closure) using Lax scheme
##D lax = route_wave(0.00008, 0.013, 1, 9.81, 6.1, 1.5, 
##D   initial.condition = 126, boundary.condition = rep(5.79, 2001), 
##D   downstream.condition = rep(0, 2001), timestep = 1, spacestep = 10, 
##D   numnodes = 501, monitor.nodes = c(1, 151, 251, 301, 501), 
##D   monitor.times = c(1, 501, 1001, 1501, 2001), 
##D   engine="Dynamic", scheme="Lax", boundary.type="yQ")
##D # extract data for a monitored point
##D require(dplyr)
##D filter(lax, monitor.type == "node", node == 151)
## End(Not run)



