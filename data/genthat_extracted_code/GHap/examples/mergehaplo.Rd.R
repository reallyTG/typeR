library(GHap)


### Name: ghap.mergehaplo
### Title: Merging GHap.haplo objects
### Aliases: ghap.mergehaplo

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
# # Select CEU and ASW individuals
# CEU.ids <- haplo$id[which(haplo$pop=="CEU")]
# ASW.ids <- haplo$id[which(haplo$pop=="ASW")]
# 
# # Randomly select a set of HapAlleles
# set.seed(1988)
# random.allele <- sample(x=c(TRUE, FALSE), size=haplo$nalleles, replace = TRUE)
# 
# # Subset data 
# haplo.CEU <- ghap.subsethaplo(haplo,ASW.ids,random.allele)
# haplo.ASW <- ghap.subsethaplo(haplo,CEU.ids,random.allele)
# 
# # Merge haplo.CEU and haplo.ASW
# haplo.merge <- ghap.mergehaplo(haplo.1 = haplo.CEU, haplo.2 = haplo.ASW, type = "individual")

  



