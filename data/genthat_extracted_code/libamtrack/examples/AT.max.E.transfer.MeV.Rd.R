library(libamtrack)


### Name: AT.max.E.transfer.MeV
### Title: AT.max.E.transfer.MeV
### Aliases: AT.max.E.transfer.MeV

### ** Examples


# Plot maximum energy transferred in a collision in the range from 1 to 1000
# MeV
# (this is independent of the ion type!) and compare the classical with
# the relativistic approach
E.MeV.u     <- 10^seq(0, 3, length.out = 50)
df          <- data.frame( E.MeV                  = E.MeV.u,
                           max.E.keV.classical    = AT.max.E.transfer.MeV(-1.0
 * E.MeV.u)$max.E.transfer.MeV * 1000,
                           max.E.keV.relativistic =
 AT.max.E.transfer.MeV(E.MeV.u)$max.E.transfer.MeV * 1000)



