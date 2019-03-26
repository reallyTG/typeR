library(libamtrack)


### Name: AT.Mass.Stopping.Power
### Title: AT.Mass.Stopping.Power
### Aliases: AT.Mass.Stopping.Power

### ** Examples

# Use stopping power data from Bethe equation
AT.Mass.Stopping.Power( E.MeV.u               = 270.55, 
                        particle.no           = 6012, 
                        material.no           =
 AT.material.no.from.material.name("Water, Liquid"), 
                        stopping.power.source = "Bethe")
# Use stopping power data from PSTAR
AT.Mass.Stopping.Power( E.MeV.u               = 270.55, 
                        particle.no           = 6012, 
                        material.no           =
 AT.material.no.from.material.name("Water, Liquid"), 
                        stopping.power.source = "PSTAR")
# Use stopping power data from ICRU
AT.Mass.Stopping.Power( E.MeV.u               = 270.55, 
                        particle.no           = 6012, 
                        material.no           =
 AT.material.no.from.material.name("Water, Liquid"), 
                        stopping.power.source = "ICRU")
# Use stopping power data from file shipped with libamtrack
# For water:
AT.Mass.Stopping.Power( E.MeV.u               = 270.55, 
                        particle.no           = 6012, 
                        material.no           =
 AT.material.no.from.material.name("Water, Liquid"), 
                        stopping.power.source = system.file("extdata",
 "FLUKA_DEDX_WATER_76.8eV.txt", package = "libamtrack"))

# And alumina (CAVE: the data file contains stopping power in keV/um, which is
# return, despite the name of the function):
AT.Mass.Stopping.Power( E.MeV.u               = 270.55, 
                        particle.no           = 6012, 
                        material.no           =
 AT.material.no.from.material.name("Aluminum Oxide"), 
                        stopping.power.source = system.file("extdata",
 "FLUKA_DEDX_ALOX.txt", package = "libamtrack"))

# When using density scaling, the value becomes clearily wrong! Thus, do
# preferably use mass stopping power data in the files
AT.Stopping.Power( E.MeV.u               = 270.55, 
                   particle.no           = 6012, 
                   material.no           =
 AT.material.no.from.material.name("Aluminum Oxide"), 
                   stopping.power.source = system.file("extdata",
 "FLUKA_DEDX_ALOX.txt", package = "libamtrack"))



