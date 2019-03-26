library(GHap)


### Name: ghap.hap2tped
### Title: Convert haplotype allele counts to PLINK tped
### Aliases: ghap.hap2tped

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
# # Generate blocks of 5 markers sliding 5 markers at a time
# blocks.mkr <- ghap.blockgen(phase, windowsize = 5, slide = 5, unit = "marker")
#
# # Generate matrix of haplotype genotypes
# ghap.haplotyping(phase, blocks.mkr, batchsize = 100, ncores = 2, outfile = "human")
#
# # Load haplotype genotypes
# haplo <- ghap.loadhaplo("human.hapsamples", "human.hapalleles", "human.hapgenotypes")
#
#
# ### RUN ###
#
# # Subset common haplotypes
# hapstats <- ghap.hapstats(haplo, ncores = 2)
# common <- hapstats$TYPE %in% c("REGULAR","MAJOR") &
#  hapstats$FREQ > 0.05 &
#  hapstats$FREQ < 0.95
# haplo <- ghap.subsethaplo(haplo,unique(haplo$id),common)
# 
# # Output GHap.haplo object
# ghap.outhaplo(haplo = haplo, outfile = "humansub")
# 
# # Convert to tped
# ghap.hap2tped(infile = "humansub", outfile = "humansub")




