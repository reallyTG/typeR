library(GHap)


### Name: ghap.ancestral
### Title: Inference of haplotype origin
### Aliases: ghap.ancestral

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
# # Compute haplotype allele statistics for each group
# haplo <- ghap.subsethaplo(haplo,haplo$id,rep(TRUE,times=haplo$nalleles))
# ASW.ids <- unique(haplo$id[haplo$pop=="ASW"])
# YRI.ids <- unique(haplo$id[haplo$pop=="YRI"])
# CEU.ids <- unique(haplo$id[haplo$pop=="CEU"])
# haplo <- ghap.subsethaplo(haplo,YRI.ids,haplo$allele.in)
# YRI.hapstats <- ghap.hapstats(haplo,ncores = 2)
# haplo <- ghap.subsethaplo(haplo,CEU.ids,haplo$allele.in)
# CEU.hapstats <- ghap.hapstats(haplo,ncores = 2)
# haplo <- ghap.subsethaplo(haplo,ASW.ids,haplo$allele.in)
# ASW.hapstats <- ghap.hapstats(haplo,ncores = 2)
# haplo <- ghap.subsethaplo(haplo,haplo$id,rep(TRUE,times=haplo$nalleles))
#
# # Find haplotype origin
# # ASW is the test population. YRI and CEU are used as parental populations
# # The frequency threshold is set to 0.05 and the probability of assignment to 0.60
# ancestry <- ghap.ancestral(ASW.hapstats, YRI.hapstats, CEU.hapstats, 0.05, 0.60)
# ancestry <- ancestry[ancestry$FREQ.TEST > 0,]




