library(GHap)


### Name: ghap.mergephase
### Title: Merging GHap.phase objects
### Aliases: ghap.mergephase

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
# # Select markers with maf > 0.05
# maf <- ghap.maf(phase, ncores = 2)
# markers <- phase$marker[maf > 0.05]
# 
# # Select ASW and CEU individuals
# ASW.ids <- unique(phase$id[phase$pop=="ASW"])
# CEU.ids <- unique(phase$id[phase$pop=="CEU"])
# 
# # Subset data 
# phase.ASW <- ghap.subsetphase(phase, ASW.ids, markers)
# phase.CEU <- ghap.subsetphase(phase, CEU.ids, markers)
# 
# # Merge phase.ASW and phase.CEU
# phase.merge <- ghap.mergephase(phase.ASW, phase.CEU)





