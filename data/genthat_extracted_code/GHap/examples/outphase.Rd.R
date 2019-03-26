library(GHap)


### Name: ghap.outphase
### Title: Output GHap.phase object to a file
### Aliases: ghap.outphase

### ** Examples



# #### DO NOT RUN IF NOT NECESSARY ###
# 
# # Copy the example data in the current working directory
# ghap.makefile()
# 
# # Load data
# phase <- ghap.loadphase("human.samples", "human.markers", "human.phase")
# 
# 
# ### RUN ###
# 
# # Subset data - markers with maf > 0.05
# maf <- ghap.maf(phase, ncores = 2)
# markers <- phase$marker[maf > 0.05]
# phase <- ghap.subsetphase(phase, unique(phase$id), markers)
# 
# # Output data
# ghap.outphase(phase, "example")
# 
# # Reload
# phasesub <- ghap.loadphase("example.samples", "example.markers", "example.phase")




