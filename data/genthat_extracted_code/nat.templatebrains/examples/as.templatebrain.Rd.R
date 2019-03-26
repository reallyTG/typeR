library(nat.templatebrains)


### Name: as.templatebrain
### Title: Use image file or other object to initialise template brain
### Aliases: as.templatebrain as.templatebrain.character
###   as.templatebrain.im3d

### ** Examples

# Make templatebrain object using image info from the template brain NRRD file
nhdr=system.file('images','FCWB.nhdr', package='nat.templatebrains')
as.templatebrain(nhdr, name = "FlyCircuit Whole Brain")



