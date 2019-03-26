library(GHap)


### Name: ghap.blockgen
### Title: Haplotype block generator
### Aliases: ghap.blockgen

### ** Examples


# #### DO NOT RUN IF NOT NECESSARY ###
# 
# # Copy the example data in the current working directory
# ghap.makefile()
# 
# # Load data
# phase <- ghap.loadphase("human.samples", "human.markers", "human.phase")
# 
# # Subset data - markers with maf > 0.05
# maf <- ghap.maf(phase, ncores = 2)
# markers <- phase$marker[maf > 0.05]
# phase <- ghap.subsetphase(phase, unique(phase$id), markers)
# 
# ### RUN ###
# 
# # Generate blocks of 5 markers sliding 5 markers at a time
# blocks.mkr <- ghap.blockgen(phase, windowsize = 5, slide = 5, unit = "marker")
# 
# # Generate blocks of 100 kb sliding 100 kbp at a time
# blocks.kb <- ghap.blockgen(phase, windowsize = 100, slide = 100, unit = "kbp")




