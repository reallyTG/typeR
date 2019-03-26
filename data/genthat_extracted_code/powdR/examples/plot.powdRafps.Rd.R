library(powdR)


### Name: plot.powdRafps
### Title: Plotting elements of a powdRafps object
### Aliases: plot.powdRafps

### ** Examples

#Load the minerals library
data(minerals)

# Load the soils data
data(soils)

## Not run: 
##D fps_sand <-  afps(lib = minerals,
##D                 smpl = soils$sandstone,
##D                 std = "QUA.1",
##D                 amorphous = "ORG",
##D                 align = 0.2)
##D 
##D plot(fps_sand)
##D plot(fps_sand, interactive = TRUE)
##D plot(fps_sand, d = TRUE, wavelength = 1.54, interactive = TRUE)
## End(Not run)



