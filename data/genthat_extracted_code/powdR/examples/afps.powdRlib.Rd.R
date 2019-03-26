library(powdR)


### Name: afps.powdRlib
### Title: Automated full pattern summation
### Aliases: afps.powdRlib

### ** Examples

#Load the minerals library
data(minerals)

# Load the soils data
data(soils)

#Since the reference library is relatively small,
#the whole library can be used at once to get an
#estimate of the phases within each sample.
## Not run: 
##D afps_sand <-  afps(lib = minerals,
##D                  smpl = soils$sandstone,
##D                  std = "QUA.1",
##D                  amorphous = "ORG",
##D                  align = 0.2)
##D 
##D afps_lime <- afps(lib = minerals,
##D                 smpl = soils$limestone,
##D                 std = "QUA.1",
##D                 amorphous = "ORG",
##D                 align = 0.2)
##D 
##D afps_granite <- afps(lib = minerals,
##D                    smpl = soils$granite,
##D                    std = "QUA.1",
##D                    amorphous = "ORG",
##D                    align = 0.2)
## End(Not run)



