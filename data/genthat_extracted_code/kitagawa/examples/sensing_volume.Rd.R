library(kitagawa)


### Name: sensing_volume
### Title: Calculate volume of fluids in the sensing region of the
###   borehole.
### Aliases: sensing_volume

### ** Examples

#### dummy example
sensing_volume(1, 1, 1, 1)
#
#### a more physically realistic calculation:
# Physical params applicable for B084 borehole
# (see: http://pbo.unavco.org/station/overview/B084/ for details)
#
Rc <- 0.0508   # m, radius of water-sensing (2in)
Lc <- 146.9    # m, length of grouted region (482ft)
Rs <- 3*Rc     # m, radius of screened region (6in)
Ls <- 9.14     # m, length of screened region (30ft)
#
# calculate the sensing volume for the given well parameters
sensing_volume(Rc, Lc, Rs, Ls) # m**3, ~= 1.8



