library(powdR)


### Name: fps
### Title: Full pattern summation
### Aliases: fps

### ** Examples

#Load the minerals library
data(minerals)

# Load the soils data
data(soils)

#Since the reference library is relatively small,
#the whole library can be used at once to get an
#estimate of the phases within each sample.
## Not run: 
##D fps_sand <-  fps(lib = minerals,
##D                  smpl = soils$sandstone,
##D                  refs = minerals$phases$phase_id,
##D                  std = "QUA.1",
##D                  align = 0.2)
##D 
##D fps_lime <- fps(lib = minerals,
##D                 smpl = soils$limestone,
##D                 refs = minerals$phases$phase_id,
##D                 std = "QUA.1",
##D                 align = 0.2)
##D 
##D fps_granite <- fps(lib = minerals,
##D                    smpl = soils$granite,
##D                    refs = minerals$phases$phase_id,
##D                    std = "QUA.1",
##D                    align = 0.2)
## End(Not run)



