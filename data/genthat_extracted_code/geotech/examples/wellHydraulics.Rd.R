library(geotech)


### Name: wellHydraulics
### Title: Well Hydraulics
### Aliases: wellHydraulics wellFlow wellDrawdown kPump

### ** Examples

##  Example code for Flow rate to well
wellFlow(k = 0.065, H = 10, h0 = 21, hf = 15, r0 = 20, rw = 2)

##  Example code for Well Drawdown
wellDrawdown(Q = 14.5, k = 0.065, H = 10, h0 = 21, r0 = 20, r = 2,
             rw = 2)

##  Example code for Hydraulic Conductivity from pumping tests
kPump(Q = 14.5, H = 10, h1 = 20, h2 = 16, r1 = 16, r2 = 8)



