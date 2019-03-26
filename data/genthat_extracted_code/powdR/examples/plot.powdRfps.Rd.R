library(powdR)


### Name: plot.powdRfps
### Title: Plotting elements of a powdRfps object
### Aliases: plot.powdRfps

### ** Examples

#Load the minerals library
data(minerals)

# Load the soils data
data(soils)

## Not run: 
##D fps_sand <-  fps(lib = minerals,
##D                 smpl = soils$sandstone,
##D                 refs = minerals$phases$phase_id,
##D                 std = "QUA.1",
##D                 align = 0.2)
##D 
##D plot(fps_sand)
##D plot(fps_sand, interactive = TRUE)
##D plot(fps_sand, d = TRUE, wavelength = 1.54, interactive = TRUE)
## End(Not run)



