library(GHap)


### Name: ghap.profile
### Title: Haplotype allele profile
### Aliases: ghap.profile

### ** Examples


# #### DO NOT RUN IF NOT NECESSARY ###
# 
# # Copy the example data in the current working directory
# ghap.makefile()
# 
# # Load data
# phase <- ghap.loadphase("human.samples", "human.markers", "human.phase")
# 
# # Subset data - randomly select 3000 markers with maf > 0.02
# maf <- ghap.maf(phase, ncores = 2)
# set.seed(1988)
# markers <- sample(phase$marker[maf > 0.02], 3000, replace = FALSE)
# phase <- ghap.subsetphase(phase, unique(phase$id), markers)
# rm(maf,markers)
# 
# # Generate block coordinates based on windows of 10 markers, sliding 5 marker at a time
# blocks <- ghap.blockgen(phase, 10, 5, "marker")
# 
# # Generate matrix of haplotype genotypes
# ghap.haplotyping(phase, blocks, batchsize = 100, ncores = 2, freq = 0.05, outfile = "example")
# 
# # Load haplotype genotypes
# haplo <- ghap.loadhaplo("example.hapsamples", "example.hapalleles", "example.hapgenotypes")
# 
# 
# ### RUN ###
# 
# # Create a score data.frame
# score <- NULL
# score$BLOCK <- haplo$block
# score$CHR <- haplo$chr
# score$BP1 <- haplo$bp1
# score$BP2 <- haplo$bp2
# score$ALLELE <- haplo$allele
# set.seed(1988)
# score$SCORE <- rnorm(length(score$ALLELE))
# score <- data.frame(score,stringsAsFactors = FALSE)
# 
# # Compute profiles
# profile <- ghap.profile(score, haplo, ncores = 2)




